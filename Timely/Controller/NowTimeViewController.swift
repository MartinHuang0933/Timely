//
//  NowTimeViewController.swift
//  Timely
//
//  Created by Mac on 2020/6/17.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class NowTimeViewController: UIViewController {

    private lazy var timerView : countTimer = {
        let timerView = countTimer()
        timerView.timeMode = .NowTimeMode
        return timerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(timerView)
        self.view.backgroundColor = MTColor_BG_Lv1
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTimer), name: NSNotification.Name(MT_TIMER_REFRESH) , object: nil)
    }
    
    override func viewWillLayoutSubviews() {
        initializeLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func initializeLayout() {
        timerView.snp.remakeConstraints { (make) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func refreshTimer() {
        timerView.refreshTimeText()
    }
}
