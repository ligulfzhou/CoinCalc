//
//  ViewController.swift
//  IOSgrpc
//
//  Created by zhou ligang on 08/01/2018.
//  Copyright © 2018 zhouligang. All rights reserved.
//

import UIKit
import SwiftProtobuf
import gRPC

class ViewController: UIViewController {

    var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton(frame: view.frame)
        button.addTarget(self, action: #selector(ViewController.sendCall), for: .touchUpInside)
        
        view.addSubview(button)
    }

    @objc func sendCall() {
        let client = Coincalc_CoinCalcService(address: "192.168.1.100:50005", secure: false)
        var req = CoinCalc_CoinListRequest()
        req.page = 1
        let result = try! client.getcoins(req)
        print(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

