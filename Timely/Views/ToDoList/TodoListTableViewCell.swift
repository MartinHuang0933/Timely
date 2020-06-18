//
//  TodoListTableViewCell.swift
//  Timely
//
//  Created by Mac on 2020/6/16.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

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
        titleLabel.text = model.title
        timerView.timerModel = model
        timerView.refreshTimeText()
    }
}


