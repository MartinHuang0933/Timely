//
//  StoryTableViewCell.swift
//  Timely
//
//  Created by Mac on 2020/4/10.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import SDWebImage

class StoryTableViewCell: UITableViewCell {
    
    @IBOutlet var demoCollectionView: UICollectionView! 
    
    var userDataArray:NSMutableArray?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCollectionView()
    }
    func setUpCollectionView(){
        
        
        let inset:CGFloat = 10
        let spacing:CGFloat = 10.0
        let itemDisplayCount:CGFloat = 5
        let size1:CGFloat = ((itemDisplayCount - 1) * spacing);
        let size2:CGFloat = (self.frame.size.width - inset * 2 - size1) / itemDisplayCount
        
        let layout = XJCollectionViewCenterLayout.initWithItemDisplayCount(Int(itemDisplayCount), itemHeight: 0, itemSpacing: spacing, scrollDirection: UICollectionView.ScrollDirection.horizontal, contentInset: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
        
//        self.collectionViewHeightConstraint.constant = size2 + 40;
        self.demoCollectionView.collectionViewLayout = layout!
        self.demoCollectionView.dataSource = self
        self.demoCollectionView.delegate = self
        self.demoCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.demoCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        self.demoCollectionView.showsHorizontalScrollIndicator = false
        self.demoCollectionView.showsVerticalScrollIndicator = false
        self.demoCollectionView.backgroundColor = UIColor.clear
    }
}

extension StoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        //创建imageView
        let imageView = UIImageView()
        imageView.sd_setImage(with: URL(string: "https://i.picsum.photos/id/1\(indexPath.row)/170/100.jpg"), placeholderImage: UIImage(named: "截圖 2020-04-08 下午2.08.26.gif"))
        imageView.frame = CGRect(x:0, y:0, width:65, height:65)
        imageView.contentMode = .scaleAspectFill
        //设置遮罩
        imageView.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        imageView.layer.cornerRadius = imageView.frame.width/2
        cell.addSubview(imageView)
        return cell
    }
}


