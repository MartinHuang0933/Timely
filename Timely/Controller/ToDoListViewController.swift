//
//  ToDoListViewController.swift
//  Timely
//
//  Created by Mac on 2020/6/17.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import EventKit
import ViewAnimator

class ToDoListViewController: UIViewController {
    
    var isFirstInit : Bool = true
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
        mainTbl.reloadData()
        let fromAnimation = AnimationType.from(direction: .right, offset: 130.0)
        DispatchQueue.main.async {
            UIView.animate(views: self.mainTbl.visibleCells, animations: [fromAnimation], delay: 0.1, duration:1)
        }
        
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
                if calendar.title == "家庭" || true
                {
                    let nowTime = Date(timeIntervalSinceNow: 0)
                    let oneMonthAfter = Date(timeIntervalSinceNow: +1*24*3600)
                    let predicate = eventStore.predicateForEvents(withStart: nowTime, end: oneMonthAfter, calendars: [calendar])
                    let events = eventStore.events(matching: predicate)
                    
                    for event in events
                    {
                        if !event.isAllDay
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
            }
            result = result.sorted(by: { $0.startDate.compare($1.startDate) == .orderedAscending })
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
        
        let lastDataCount = cellModels?.count
        
        cellModels = getCalendarData()
        mainTbl.reloadData()
        
        if lastDataCount != cellModels?.count {
            let fromAnimation = AnimationType.from(direction: .right, offset: 130.0)
            DispatchQueue.main.async {
                UIView.animate(views: self.mainTbl.visibleCells, animations: [fromAnimation], delay: 0.1, duration:1)
            }
        }
    }
    
    func isCalendarItemBegin(model:TimerModel) -> Bool
    {
        let dt = Date()
        let compareStartDate = dt.compareCurrntTimeComponents(date: dt.date2TaipeiDate(date: model.startDate))
        return (compareStartDate.hour!<=0 && compareStartDate.minute!<=0)
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
        let model = cellModels![indexPath.row]
        return isCalendarItemBegin(model: model) ? 300 : 120 ;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cellModels![indexPath.row]
        if isCalendarItemBegin(model: model) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as! TodoListTableViewCell
            cell.setModel(model: model)
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListSubTableViewCell", for: indexPath) as! TodoListSubTableViewCell
            cell.setModel(model: model)
            cell.selectionStyle = .none
            return cell
        }
    }
}
