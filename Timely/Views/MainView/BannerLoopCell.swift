//
//  TableViewCell.swift
//  Timely
//
//  Created by Mac on 2020/4/9.
//  Copyright © 2020 Martin. All rights reserved.
//

import UIKit
import LLCycleScrollView

class BannerLoopCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initBanner(model: BannerLoopModel){
        
        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0, width: self.contentView.frame.size.width, height: 200))
        // 2018-02-25 新增协议
        bannerDemo.delegate = self
        // 是否自动滚动
        bannerDemo.autoScroll = true
        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
        bannerDemo.infiniteLoop = true
        // 滚动间隔时间(默认为2秒)
        bannerDemo.autoScrollTimeInterval = 3.0
        // 等待数据状态显示的占位图
        bannerDemo.placeHolderImage = UIImage.init(named: "截圖 2020-04-08 下午2.08.26.gif")
        // 如果没有数据的时候，使用的封面图
        bannerDemo.coverImage = UIImage.init(named: "截圖 2020-04-08 下午2.08.26.gif")
        // 设置图片显示方式=UIImageView的ContentMode
        bannerDemo.imageViewContentMode = .scaleToFill
        // 设置滚动方向（ vertical || horizontal ）
        bannerDemo.scrollDirection = .horizontal
        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        bannerDemo.customPageControlStyle = .snake
        // 非.system的状态下，设置PageControl的tintColor
        bannerDemo.customPageControlInActiveTintColor = UIColor.white
        // 设置.system系统的UIPageControl当前显示的颜色
        bannerDemo.pageControlCurrentPageColor = UIColor.white
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        bannerDemo.customPageControlIndicatorPadding = 8.0
        // 设置PageControl的位置 (.left, .right 默认为.center)
        bannerDemo.pageControlPosition = .center
        // 图片获取
        bannerDemo.imagePaths = model.imagesURLStrings
        // 添加到view
        self.contentView.addSubview(bannerDemo)
    }
}

extension BannerLoopCell: LLCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: LLCycleScrollView, didSelectItemIndex index: NSInteger) {
        print("协议：当前点击文本的位置为:\(index)")
    }
}
