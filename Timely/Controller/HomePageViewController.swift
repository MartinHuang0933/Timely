//
//  HomePageViewController.swift
//  Timely
//
//  Created by Mac on 2020/6/12.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    
    let pageNumber : CGFloat = 3
    var timer: Timer?
    let timerView = countTimer()

    lazy var mainScroll: UIScrollView = {
        let mainScroll = UIScrollView()
        mainScroll.backgroundColor = #colorLiteral(red: 0.1271939278, green: 0.1271939278, blue: 0.1271939278, alpha: 1)
        mainScroll.contentSize = CGSize(width: (KScreenWidth * pageNumber), height: 0)
        mainScroll.isPagingEnabled = true
        return mainScroll
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(mainScroll);
        mainScroll.addSubview(contentView)
        contentView.addSubview(timerView)
        
        initializeLayout()
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: timerView, selector: #selector(timerView.refreshTimeText), userInfo: nil, repeats: true)
    }
    
    func initializeLayout() {
        
        KScreenWidth = UIScreen.main.bounds.size.width
        
        mainScroll.snp.remakeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        
        contentView.snp.remakeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(mainScroll)
            make.width.equalTo(KScreenWidth * pageNumber)
        }
        
        timerView.snp.remakeConstraints { (make) -> Void in
            make.top.bottom.equalTo(view)
            make.left.equalTo(contentView)
            make.width.equalTo(KScreenWidth)
        }
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        
        initializeLayout()
        
        // 告诉self.view约束需要更新
        self.view.needsUpdateConstraints()
        // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
        self.view.updateConstraintsIfNeeded()
    
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
