//
//  WalletTableViewCell.swift
//  IOSgrpc
//
//  Created by zhou ligang on 12/01/2018.
//  Copyright © 2018 zhouligang. All rights reserved.
//

import UIKit

class WalletTableViewCell: UITableViewCell {

    var symbolLable: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.black)
        lbl.lineBreakMode = .byClipping
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        return lbl
    }()
    
    var nameLabel: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    var changeLabel: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.heavy)
        lbl.lineBreakMode = .byClipping
        lbl.numberOfLines = 1
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 5
        lbl.layer.masksToBounds = true
        return lbl
    }()
    
    var priceLabel: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.light)
        lbl.lineBreakMode = .byClipping
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        return lbl
    }()

    var userCoin: CoinCalc_UserCoin? = nil {
        didSet {
            nameLabel.text = userCoin?.coin.name
            symbolLable.text = userCoin?.symbol
            
            guard let price = userCoin?.coin.priceUsd else {
                return
            }
            priceLabel.text = "$\(Float(price)!)*\(Float((userCoin?.cnt)!)!)="
            changeLabel.text = "$\(String(Int(Float(price)! * Float((userCoin?.cnt)!)!)))"
        }
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        addSubview(symbolLable)
        symbolLable.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(20)
            make.centerX.equalTo(self).dividedBy(2.0)
            make.width.equalTo(self).dividedBy(3.0)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self).dividedBy(2.0)
            make.top.equalTo(symbolLable.snp.bottom).offset(5)
            make.left.equalTo(self).offset(20)
            make.width.equalTo(self).dividedBy(3.0)
            make.bottom.equalTo(self).offset(-10)
        }
        
        addSubview(changeLabel)
        changeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-20)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.width.equalTo(100)
        }
        changeLabel.backgroundColor = UIColor.red
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(changeLabel.snp.left).offset(-15)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.width.equalTo(self).dividedBy(3.0)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
