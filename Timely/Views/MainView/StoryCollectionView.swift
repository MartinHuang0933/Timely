//
//  StoryCollectionView.swift
//  Timely
//
//  Created by Mac on 2020/4/10.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
//import XJCollectionViewCenterLayout

class StoryCollectionView: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setupCollectionView()
    {
        let inset:CGFloat = 20
        let spacing:CGFloat = 10.0
        let itemDisplayCount:CGFloat = 2
        let size1:CGFloat = ((itemDisplayCount - 1) * spacing);
        let size2:CGFloat = (self.frame.size.width - inset * 2 - size1) / itemDisplayCount
        
        let layout = XJCollectionViewCenterLayout.initWithItemDisplayCount(Int(itemDisplayCount), itemHeight: 0, itemSpacing: spacing, scrollDirection: UICollectionView.ScrollDirection.horizontal, contentInset: UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset))
        
//        self.collectionViewHeightConstraint.constant = size2 + 40;
        self.collectionViewLayout = layout!;
        self.dataSource = self;
        self.delegate = self;
        self.decelerationRate = UIScrollView.DecelerationRate.fast;
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UniqueCellIdentifier")
        
        
        
    }
}

extension StoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:UICollectionViewCell = self.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
}


