//
//  MainViewController.swift
//  Timely
//
//  Created by Mac on 2020/4/9.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
//import LLCycleScrollView

class MainViewController: UIViewController{

    
    @IBOutlet var mainTbl: UITableView!
   // @IBOutlet var storyCollectionView: UICollectionView!
    @IBOutlet var sss: UICollectionView!
    @IBOutlet var storyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.mainTbl.delegate = self
        self.mainTbl.dataSource = self
        self.mainTbl.bounces = false //禁止tableView弹性效果
        self.mainTbl.separatorStyle = UITableViewCell.SeparatorStyle.none //去掉整個tableView的所有cell分割線
    
        mainTbl.register(UINib(nibName: "StoryTableViewCell", bundle: nil), forCellReuseIdentifier: "StoryTableViewCell")
        mainTbl.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        
    }
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 80
        case 2:
            return 180
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerLoopCell", for: indexPath) as? BannerLoopCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor.clear
            
            let model = BannerLoopModel()
            let imagesURLStrings = [
//                "https://i.picsum.photos/id/1\(Int.random(in: 0...2))/170/100.jpg",
//                "https://i.picsum.photos/id/1\(Int.random(in: 0...2))/170/100.jpg",
//                "https://i.picsum.photos/id/1\(Int.random(in: 0...2))/170/100.jpg",
                "https://picsum.photos/375/200?1",
                "https://picsum.photos/375/200?12",
                "https://picsum.photos/375/200?13",
                // https://picsum.photos/300/200.jpg?\(Int.random(in: 0...999))
                // https://i.picsum.photos/id/1\(indexPath.row)/170/100.jpg
                //https://i.picsum.photos/id/1\(Int.random(in: 0...99)/170/100.jpg
            ];
            model.imagesURLStrings = imagesURLStrings
            
            cell.initBanner(model: model)
            return cell
        }else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableViewCell
            cell.backgroundColor = UIColor.clear
            return cell
        }else if(indexPath.row == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            cell.backgroundColor = UIColor.clear
            return cell
        }
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "Cell")
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}



