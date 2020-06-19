//
//  TodoListSubTableViewCell.swift
//  Timely
//
//  Created by Mac on 2020/6/18.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class TodoListSubTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    }
    
    func setModel(model:TimerModel) {
        let stratDate = Date().date2String(model.startDate, dateFormat: "HH:mm")
        let endDate = Date().date2String(model.endDate, dateFormat: "HH:mm")
        timeLabel.text = "時間：\(stratDate) - \(endDate)"
        titleLabel.text = model.title
    }
}
