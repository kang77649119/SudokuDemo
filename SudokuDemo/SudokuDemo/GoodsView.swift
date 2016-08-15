//
//  GoodsView.swift
//  SudokuDemo
//
//  Created by 也许、 on 16/8/15.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class GoodsView: UIView {

    @IBOutlet weak var goodsImg: UIImageView!
    
    @IBOutlet weak var goodsNameLabel: UILabel!
    
    var shop:Shop? {
        didSet {
            self.goodsImg.image = UIImage(named: shop!.icon!)
            self.goodsNameLabel.text = shop!.name
        }
    }
    
    // 加载视图
    static func goodsView() -> GoodsView {
        return NSBundle.mainBundle().loadNibNamed( "GoodsView", owner: nil, options: nil).last as! GoodsView
    }

}
