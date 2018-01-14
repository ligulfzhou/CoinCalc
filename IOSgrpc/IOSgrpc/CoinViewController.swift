//
//  CoinViewController.swift
//  IOSgrpc
//
//  Created by zhou ligang on 09/01/2018.
//  Copyright © 2018 zhouligang. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit
import gRPC
import Toast_Swift
import GoogleMobileAds


class CoinViewController: UIViewController {

    var curPage:Int32 = 1
    var coinList: [CoinCalc_Coin] = []
    var tableView: UITableView!
    lazy var footer = MJRefreshAutoNormalFooter()
    lazy var header = MJRefreshNormalHeader()
    var identifier = "CoinTableViewCellIden"
    var banner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Coins"
        footer.setRefreshingTarget(self, refreshingAction: #selector(CoinViewController.refreshFooter))
        header.setRefreshingTarget(self, refreshingAction: #selector(CoinViewController.refreshHeader))
        
        banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.rootViewController = self
        banner.adUnitID = "ca-app-pub-9174125730777485/7416116941"
        view.addSubview(banner)
        banner.sizeToFit()
        banner.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-49)
            make.centerX.equalTo(view)
        }
        let req = GADRequest()
        req.testDevices = [ kGADSimulatorID, "f3f1e0559573881fc3647836492075a3" ]
        banner.load(req)
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.register(CoinTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableView.mj_footer = footer
        tableView.mj_header = header
        view.addSubview(tableView)

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.bottom.equalTo(banner.snp.top).offset(5)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }

        periodFetch()
    }

    func periodFetch(){
        curPage = 1
        fetchCoins(page: curPage, isHeader: true)
        NSLog("periodic refresh");
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.periodFetch()
        }
    }
    
    @objc func refreshFooter() {
        NSLog("refresh footer")
        tableView.mj_footer.beginRefreshing()
    }

    @objc func refreshHeader() {
        NSLog("refresh header")
        curPage = 1
        fetchCoins(page: curPage, isHeader: true)
    }

    @objc func fetchCoins(page: Int32, isHeader: Bool) {
        var req = CoinCalc_CoinListRequest()
        req.page = Int32(page)
        
        try! GRPC_CLIENT.getcoins(req) {
            (response: CoinCalc_CoinListResponse?, result: CallResult) in
            
            guard let coins = response?.coins else {
                return
            }

            print("coins, \(coins.count)")
            if isHeader {
                self.coinList = coins
            } else {
                self.coinList = self.coinList + coins
            }
            
            if self.coinList.count == 0 {
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.mj_footer.endRefreshing()
                self.tableView.mj_header.endRefreshing()
                self.tableView.reloadData()
                self.tableView.setNeedsLayout()
                self.tableView.layoutIfNeeded()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CoinViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CoinTableViewCell
        
        print("cell.coin at indexPath.row \(indexPath.row): \(self.coinList[indexPath.row])")
        cell.coin = self.coinList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coinList.count
    }
}

extension CoinViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // 让用户输入有多少个这种币，并提交到线上
        let coinAtIndex = coinList[indexPath.row]
        let addToCollectionAction = UITableViewRowAction(style: .default, title: "Add To Wallet") {
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
                try! GRPC_CLIENT.setusercoin(req, completion: {
                    (response: CoinCalc_SetUserCoinResponse?, result: CallResult) in
                    
                    guard let coin = response?.uc.symbol else {
                        DispatchQueue.main.async {
                            self.navigationController?.view.makeToast("Add Failed, Please Try Again", duration: 2.0, position: .center)
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        self.navigationController?.view.makeToast("Added Successfully", duration: 2.0, position: .center)
                    }
                })
            })
            alertController.addTextField(configurationHandler: {
                (textField: UITextField) in
                
                textField.placeholder = "How Many \(coinAtIndex.name)s DO You Have?"
                textField.borderStyle = .roundedRect
                textField.textColor = .red
                textField.clearButtonMode = .whileEditing
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        return [addToCollectionAction]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}


