//
//  ToDoListViewController.swift
//  Timely
//
//  Created by Mac on 2020/6/17.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import EventKit

class ToDoListViewController: UIViewController {
    
    var cellModels : [TimerModel]?
    
    lazy var mainTbl: UITableView = {
        let mainTbl = UITableView()
        mainTbl.backgroundColor = .clear
        mainTbl.delegate = self
        mainTbl.dataSource = self
        mainTbl.separatorStyle = .none
        mainTbl.showsHorizontalScrollIndicator = false
        mainTbl.showsVerticalScrollIndicator = false
        return mainTbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MTColor_BG_Lv1
        self.view.addSubview(mainTbl)
        self.mainTbl.register(UINib(nibName: "TodoListTableViewCell", bundle: nil),
                              forCellReuseIdentifier: "TodoListTableViewCell")
        self.mainTbl.register(UINib(nibName: "TodoListSubTableViewCell", bundle: nil),
                              forCellReuseIdentifier: "TodoListSubTableViewCell")
        
        cellModels = getCalendarData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshMainTbl), name: NSNotification.Name(MT_TIMER_REFRESH) , object: nil)
    }
    
    override func viewWillLayoutSubviews() {
        initializeLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func getCalendarData() -> [TimerModel]{
        
        var result: [TimerModel] = []
        let semaphore = DispatchSemaphore(value: 0)
        //取得授權
        EKEventStore().requestAccess(to: .event, completion: { (status, error) in
            
            let eventStore = EKEventStore()
            let calendars = eventStore.calendars(for: .event)
            for calendar in calendars
            {
                if calendar.title == "家庭"
                {
                    let nowTime = Date(timeIntervalSinceNow: 0)
                    let oneMonthAfter = Date(timeIntervalSinceNow: +1*24*3600)
                    let predicate = eventStore.predicateForEvents(withStart: nowTime, end: oneMonthAfter, calendars: [calendar])
                    let events = eventStore.events(matching: predicate)
                    
                    for event in events
                    {
                        let startDate = event.startDate
                        let endDate = event.endDate
                        let model = TimerModel(startDate: startDate!,
                                               endDate: endDate!,
                                               title: event.title)
                        result.append(model)
                    }
                }
            }
            semaphore.signal()
        })
        
        _ = semaphore.wait(wallTimeout: .distantFuture)
        return result
    }
    
    func initializeLayout() {
        
        mainTbl.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    
    @objc func refreshMainTbl() {
        cellModels = getCalendarData()
        mainTbl.reloadData()
    }
}

extension ToDoListViewController: UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }else{
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as! TodoListTableViewCell
            cell.setModel(model: cellModels![indexPath.row])
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListSubTableViewCell", for: indexPath) as! TodoListSubTableViewCell
            cell.setModel(model: cellModels![indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
}
