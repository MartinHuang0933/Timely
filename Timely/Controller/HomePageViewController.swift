//
//  BaseViewController.swift
//  JXPagingView
//
//  Created by jiaxin on 2018/8/10.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

import UIKit
import DNSPageView

class HomePageViewController: UIViewController {
    
    var timer: Timer?
    
    private lazy var pageViewManager: PageViewManager = {
        // 创建PageStyle，设置样式
        let style = PageStyle()
        style.isShowBottomLine = true
        style.isTitleViewScrollEnabled = true
        style.titleViewBackgroundColor = UIColor.clear
        
        // 设置标题内容
        let titles = ["時鐘", "待辦"]
        let controllers = ["NowTimeViewController", "ListViewController"]
        
        let controller1 = NowTimeViewController()
        let controller2 = ToDoListViewController()
        
        addChild(controller1)
        addChild(controller2)
        
        return PageViewManager(style: style, titles: titles, childViewControllers: children)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        
        // 单独设置titleView的frame
        navigationItem.titleView = pageViewManager.titleView
        pageViewManager.titleView.frame = CGRect(x: 0, y: 0, width: 180, height: 0)
        
        // 单独设置contentView的大小和位置，可以使用autolayout或者frame
        let contentView = pageViewManager.contentView
        view.addSubview(pageViewManager.contentView)
        contentView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        if #available(iOS 11, *) {
            contentView.collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func startTimer() {
        let nowSecond = CommonFunction.getCalendar().component(.second, from: Date().localDate())
        let loopTime = Double(60-nowSecond)
        self.timer = Timer.scheduledTimer(timeInterval: loopTime, target: self, selector: #selector(uptadeTimer), userInfo: nil, repeats: false)
    }
    
    @objc func uptadeTimer() {
        if self.timer != nil {
            self.timer?.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(uptadeTimer), userInfo: nil, repeats: false)
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: MT_TIMER_REFRESH), object: nil, userInfo:nil)
    }
}
