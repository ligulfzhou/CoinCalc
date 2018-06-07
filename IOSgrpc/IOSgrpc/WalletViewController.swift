//
//  WalletViewController.swift
//  IOSgrpc
//
//  Created by zhou ligang on 12/01/2018.
//  Copyright © 2018 zhouligang. All rights reserved.
//

import UIKit
import gRPC
import MJRefresh
import Toast_Swift
import GoogleMobileAds

class WalletViewController: UIViewController {

    var userCoins: [CoinCalc_UserCoin] = []
    var userCoinKeys: [String] = []
    var totalSum: Int = 0
    var tableView: UITableView!
    lazy var header = MJRefreshNormalHeader()
    var identifier = "WalletTableViewCellIden"
    var banner: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Wallet"

        banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.rootViewController = self
        banner.adUnitID = "ca-app-pub-9174125730777485/2899308930"
        view.addSubview(banner)
        banner.sizeToFit()
        banner.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-49)
            make.centerX.equalTo(view)
        }
        let req = GADRequest()
//        req.testDevices = [ kGADSimulatorID, "f3f1e0559573881fc3647836492075a3" ]
        req.testDevices = [ kGADSimulatorID, "f3f1e0559573881fc3647836492075a3" ]

        banner.load(req)
        
        header.setRefreshingTarget(self, refreshingAction: #selector(WalletViewController.refreshHeader))
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.register(WalletTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableView.mj_header = header
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.bottom.equalTo(banner.snp.top).offset(5)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
        fetchUserCoins()
    }
    
    @objc func refreshHeader() {
        fetchUserCoins()
    }
    
    func fetchUserCoins() {
        var req = CoinCalc_GetUserCoinRequest()
        req.user = userName!
        try! GRPC_CLIENT.getusercoins(req) { (response: CoinCalc_GetUserCoinsResponse?, result: CallResult) in
            DispatchQueue.main.async {
                self.tableView.mj_header.endRefreshing()
            }

//            guard let coins = response?.ucs else {
//                return
//            }
            let coins = response?.ucs
            self.userCoins = coins!
            self.userCoinKeys = []
 
            if self.userCoins.count == 0 {
                return
            }
            
            self.totalSum = 0
            if self.userCoins.count > 0 {
                for coin in self.userCoins {
                    self.totalSum += Int(Float(coin.coin.priceUsd)! * Float(coin.cnt)!)
                    self.userCoinKeys.append("\(coin.coin.symbol)_\(coin.coin.name)")
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.mj_header.endRefreshing()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension WalletViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCoins.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! WalletTableViewCell
        cell.userCoin = userCoins[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "You Have $\(self.totalSum) Worth of Coins"
    }
}

extension WalletViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // 让用户输入有多少个这种币，并提交到线上
        let coinAtIndex = userCoins[indexPath.row]
        let key: String = "\(coinAtIndex.symbol)_\(coinAtIndex.name)"
        
        var addTitle: String = "Add To Wallet"
        if self.userCoinKeys.index(of: key) != nil {
            addTitle = "Change Cnt"
        }
        
        let addToCollectionAction = UITableViewRowAction(style: .normal, title: addTitle) {
            (action: UITableViewRowAction, indexPath: IndexPath) in
            
            print(indexPath)
            
            let alertController = UIAlertController(title: "Add Coin To Wallet", message: "How Many \(coinAtIndex.symbol) do You Have", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction) in
                
                let textfields = alertController.textFields
                let coinCountField = textfields![0]
                print(coinCountField.text ?? "0")
                
                var coinCnt: String = "0"
                let cnt = Float(coinCountField.text!)
                if cnt == nil {
                    coinCnt = "0"
                    DispatchQueue.main.async {
                        self.navigationController?.view.makeToast("Please Input Number", duration: 2.0, position: .center)
                    }
                    return
                } else {
                    coinCnt = coinCountField.text!
                }
                
                var req = CoinCalc_SetUserCoinRequest()
                req.uc = CoinCalc_UserCoin()
                req.uc.cnt = coinCnt
                req.uc.user = userName!
                req.uc.symbol = coinAtIndex.symbol
                req.uc.name = coinAtIndex.name
                
                try! GRPC_CLIENT.setusercoin(req, completion: {
                    (response: CoinCalc_SetUserCoinResponse?, result: CallResult) in
                    
                    guard let coin = response?.uc.symbol else {
                        DispatchQueue.main.async {
                            self.navigationController?.view.makeToast("Change Failed, Please Try Again", duration: 2.0, position: .center)
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        self.navigationController?.view.makeToast("Changed Successfully", duration: 2.0, position: .center)
                    }
                })
            })
            alertController.addTextField(configurationHandler: {
                (textField: UITextField) in
                
                textField.placeholder = "How Many \(coinAtIndex.coin.symbol)s DO You Have?"
                textField.borderStyle = .roundedRect
                textField.textColor = .red
                textField.clearButtonMode = .whileEditing
                textField.delegate = self
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        if self.userCoinKeys.index(of: key) != nil {
            let deleteCoinAction = UITableViewRowAction(style: .default, title: "Delete") {
                (action: UITableViewRowAction, indexPath: IndexPath) in
                
                print(indexPath)
                
                let alertController = UIAlertController(title: "Add Coin To Wallet", message: "How Many \(coinAtIndex.symbol) do You Have", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction) in
                    
                    var req = CoinCalc_DeleteUserCoinRequest()
                    req.name = coinAtIndex.name
                    req.symbol = coinAtIndex.symbol
                    req.user = coinAtIndex.user
                    
                    try! GRPC_CLIENT.deleteusercoin(req, completion: { ( empty: CoinCalc_Empty?, result: CallResult) in
                        DispatchQueue.main.async {
                            self.navigationController?.view.makeToast("Delete Successfully", duration: 2.0, position: .center)
                            self.userCoins = []
                            self.userCoinKeys = []
                            self.fetchUserCoins()
                        }
                    })
                })
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            return [deleteCoinAction, addToCollectionAction]
        }
        
        return [addToCollectionAction]
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}




extension WalletViewController: UITextFieldDelegate {
    
}









