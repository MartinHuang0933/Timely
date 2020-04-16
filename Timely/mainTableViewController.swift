//
//  mainTableViewController.swift
//  Timely
//
//  Created by Mac on 2020/3/13.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class mainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
        
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
//
//        // Configure the cell...
//
//
//        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0 + 205, width: 1000, height: 200))
//        // 是否自动滚动
//        bannerDemo.autoScroll = true
//        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
//        bannerDemo.infiniteLoop = true
//        // 滚动间隔时间(默认为2秒)
//        bannerDemo.autoScrollTimeInterval = 3.0
//        // 等待数据状态显示的占位图
//        bannerDemo.placeHolderImage = UIImage.init(named: "截圖 2020-04-08 下午2.08.26.png")
//        // 如果没有数据的时候，使用的封面图
//        bannerDemo.coverImage = UIImage.init(named: "截圖 2020-04-08 下午2.08.26.png")        // 设置图片显示方式=UIImageView的ContentMode
//        bannerDemo.imageViewContentMode = .scaleToFill
//        // 设置滚动方向（ vertical || horizontal ）
//        bannerDemo.scrollDirection = .vertical
//        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
//        bannerDemo.customPageControlStyle = .snake
//        // 非.system的状态下，设置PageControl的tintColor
//        bannerDemo.customPageControlInActiveTintColor = UIColor.red
//        // 设置.system系统的UIPageControl当前显示的颜色
//        bannerDemo.pageControlCurrentPageColor = UIColor.white
//        // 非.system的状态下，设置PageControl的间距(默认为8.0)
//        bannerDemo.customPageControlIndicatorPadding = 8.0
//        // 设置PageControl的位置 (.left, .right 默认为.center)
//        bannerDemo.pageControlPosition = .center
//        // 背景色
//        bannerDemo.collectionViewBackgroundColor = UIColor.red
//        // 添加到view
//        cell.contentView.addSubview(bannerDemo)

        // 模拟网络图片获取
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
//          bannerDemo.imagePaths = imagesURLStrings
//        }
//
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
