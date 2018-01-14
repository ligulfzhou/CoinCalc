//
//  CoinTableViewCell.swift
//  IOSgrpc
//
//  Created by zhou ligang on 09/01/2018.
//  Copyright © 2018 zhouligang. All rights reserved.
//

import UIKit
import SnapKit

class CoinTableViewCell: UITableViewCell {

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
        lbl.lineBreakMode = .byClipping
        lbl.numberOfLines = 1
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
    
    var coin: CoinCalc_Coin? = nil {
        didSet {
            nameLabel.text = coin?.name
            symbolLable.text = coin?.symbol
            changeLabel.text = coin?.percentChangeOneDay
            priceLabel.text = coin?.priceUsd
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
            make.width.equalTo(50)
        }
        changeLabel.backgroundColor = UIColor.red
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(changeLabel.snp.left).offset(-15)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
            make.width.equalTo(80)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
