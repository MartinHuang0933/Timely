//
//  countTimer.swift
//  Timely
//
//  Created by Mac on 2020/6/12.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import SnapKit

class countTimer: UIView {

    let RLMargin : CGFloat = 15
    let LabelMargin : CGFloat = 10
    
    lazy var HourLabel: UILabel = {
        let HourLabel = UILabel()
        HourLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        HourLabel.text = "\(CommonFunction.getHour())"
        HourLabel.textAlignment = .center
        HourLabel.font = UIFont.systemFont(ofSize: 110)
        return HourLabel
    }()
    
    lazy var SplitLabel: UILabel = {
        let SplitLabel = UILabel()
        SplitLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        SplitLabel.text = "："
        SplitLabel.textAlignment = .center
        SplitLabel.font = UIFont.systemFont(ofSize: 60)
        return SplitLabel
    }()
    
    lazy var MinuteLabel: UILabel = {
        let MinuteLabel = UILabel()
        MinuteLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        MinuteLabel.text = "\(CommonFunction.getMinute())"
        MinuteLabel.textAlignment = .center
        MinuteLabel.font = UIFont.systemFont(ofSize: 110)
        return MinuteLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(HourLabel)
        addSubview(SplitLabel)
        addSubview(MinuteLabel)
        
        initializeLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeLayout() {
        SplitLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.centerX.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(100)
        }
        
        HourLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(SplitLabel)
            make.right.equalTo(SplitLabel.snp.left).offset(-LabelMargin)
            make.left.equalTo(self).offset(RLMargin)
            make.height.equalTo(100)
        }
        
        MinuteLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(SplitLabel)
            make.left.equalTo(SplitLabel.snp.right).offset(LabelMargin)
            make.right.equalTo(self).offset(-RLMargin)
            make.height.equalTo(100)
        }
    }
    
    @objc func refreshTimeText() {
        HourLabel.text = "\(CommonFunction.getHour())"
        MinuteLabel.text = "\(CommonFunction.getMinute())"
    }
    
//    @objc func refreshOrientation() {
//        HourLabel.text = "\(CommonFunction.getHour())"
//        MinuteLabel.text = "\(CommonFunction.getMinute())"
//    }
}
