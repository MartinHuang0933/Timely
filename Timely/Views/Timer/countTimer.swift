//
//  countTimer.swift
//  Timely
//
//  Created by Mac on 2020/6/12.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import SnapKit

enum TimeMode: Int {
    case NowTimeMode = 0
    case CountDownMode = 1
}

class countTimer: UIView {
    
    let RLMargin : CGFloat = 15
    let LabelMargin : CGFloat = 10
    var timeMode : TimeMode?
    var timerModel : TimerModel?
    
    lazy var HourLabel: UILabel = {
        let HourLabel = UILabel()
        HourLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        HourLabel.textAlignment = .center
        HourLabel.font = UIFont.init(name: "Helvetica Neue", size: 110)
        return HourLabel
    }()
    
    lazy var SplitLabel: UILabel = {
        let SplitLabel = UILabel()
        SplitLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        SplitLabel.text = "："
        SplitLabel.textAlignment = .center
        SplitLabel.font = UIFont.init(name: "Helvetica Neue", size: 60)
        return SplitLabel
    }()
    
    lazy var MinuteLabel: UILabel = {
        let MinuteLabel = UILabel()
        MinuteLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        MinuteLabel.textAlignment = .center
        MinuteLabel.font = UIFont.init(name: "Helvetica Neue", size: 110)
        return MinuteLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(HourLabel)
        addSubview(SplitLabel)
        addSubview(MinuteLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        HourLabel.adjustsFontSizeToFitWidth = true
        HourLabel.minimumScaleFactor = 0.5
        MinuteLabel.adjustsFontSizeToFitWidth = true
        MinuteLabel.minimumScaleFactor = 0.5
        
        initializeLayout()
        refreshTimeText()
    }
    
    func initializeLayout() {
        SplitLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.centerX.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(self)
        }
        
        HourLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(SplitLabel)
            make.right.equalTo(SplitLabel.snp.left).offset(-LabelMargin)
            make.left.equalTo(self).offset(RLMargin)
            make.height.equalTo(self)
        }
        
        MinuteLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(SplitLabel)
            make.left.equalTo(SplitLabel.snp.right).offset(LabelMargin)
            make.right.equalTo(self).offset(-RLMargin)
            make.height.equalTo(self)
        }
    }
    
    @objc func refreshTimeText()
    {
        if(timeMode == .NowTimeMode){
            HourLabel.text = "\(CommonFunction.getHour())"
            MinuteLabel.text = "\(CommonFunction.getMinute())"
        }else{
            if let timermodel = timerModel {
                let currntTime = Date().compareCurrntTime(date: timermodel.endDate)
                HourLabel.text = currntTime.hour
                MinuteLabel.text = currntTime.minute
            }
        }
    }
}



