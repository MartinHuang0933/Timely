//
//  CategoryTableViewCell.swift
//  Timely
//
//  Created by Mac on 2020/4/14.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCollectionView()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setUpCollectionView(){
            
            
        let inset:CGFloat = 10
        let spacing:CGFloat = 10.0
        let itemDisplayCount:CGFloat = 2
        let size1:CGFloat = ((itemDisplayCount - 1) * spacing);
        let size2:CGFloat = (self.frame.size.width - inset * 2 - size1) / itemDisplayCount
        
        let layout = XJCollectionViewCenterLayout.initWithItemDisplayCount(Int(itemDisplayCount), itemHeight: 0, itemSpacing: spacing, scrollDirection: UICollectionView.ScrollDirection.horizontal, contentInset: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
        
        self.collectionViewHeightConstraint.constant = size2 + 40;
        self.categoryCollectionView.collectionViewLayout = layout!
        self.categoryCollectionView.dataSource = self
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        self.categoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        self.categoryCollectionView.showsHorizontalScrollIndicator = false
        self.categoryCollectionView.showsVerticalScrollIndicator = false
        self.categoryCollectionView.backgroundColor = UIColor.clear
    }
}

extension CategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        //创建imageView
        let imageView = UIImageView()
        imageView.sd_setImage(with: URL(string: "https://i.picsum.photos/id/1\(indexPath.row)/170/100.jpg"), placeholderImage: UIImage(named: "截圖 2020-04-08 下午2.08.26.gif"))
        imageView.frame = CGRect(x:0, y:0, width:cell.contentView.frame.size.width, height:cell.contentView.frame.size.height)
        imageView.contentMode = .scaleAspectFill
        //设置遮罩
        imageView.layer.masksToBounds = true
        //设置圆角半径(宽度的一半)，显示成圆形。
        imageView.layer.cornerRadius = 15
        cell.addSubview(imageView)
        return cell
    }
}




