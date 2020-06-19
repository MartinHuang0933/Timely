//
//  TodoListTableViewCell.swift
//  Timely
//
//  Created by Mac on 2020/6/16.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import ViewAnimator

class TodoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var timerContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    lazy var timerView : countTimer = {
        let timerView = countTimer()
        timerView.timeMode = .CountDownMode
        return timerView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timerContainer.addSubview(timerView)
        
        
        let animation = AnimationType.zoom(scale: 0.5)
        self.animate(animations: [animation])
        
        
//        self.animate(views: [self],
//                     animations: [animation],
//                     reversed: false,
//                     initialAlpha: 0.0,
//                     finalAlpha: 1.0,
//                     delay: 0,
//                     animationInterval: 0.05,
//                     duration:  ViewAnimatorConfig.duration,
//                     dampingRatio:  ViewAnimatorConfig.springDampingRatio,
//                     velocity: ViewAnimatorConfig.initialSpringVelocity,
//            completion: (() -> Void)? = nil)
        //        self.animate(animations: [animation])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainContainer.backgroundColor = MTColor_BG_Lv2
        mainContainer.layer.cornerRadius = 15
        titleLabel.textAlignment = .natural
        titleLabel.numberOfLines = 0;
        titleLabel.sizeToFit()
        initializeLayout()
        
    }
    
    func initializeLayout() {
        
        timerView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(timerContainer)
        }
    }
    
    func setModel(model:TimerModel) {
        print(model)
        let stratDate = Date().date2String(model.startDate, dateFormat: "HH:mm")
        let endDate = Date().date2String(model.endDate, dateFormat: "HH:mm")
        timeLabel.text = "時間：\(stratDate) - \(endDate)"
        titleLabel.text = model.title
        timerView.timerModel = model
        timerView.refreshTimeText()
    }
}


