//
//  ShopView.swift
//  SudokuDemo
//
//  Created by 也许、 on 16/8/15.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ShopView: UIView {
    
    var goodsImg:UIImageView?
    var goodsLabel:UILabel?
    
    var shop:Shop? {
        didSet {
            self.goodsImg?.image = UIImage(named: shop!.icon!)
            self.goodsLabel?.text = shop!.name
        }
    }
    
    /**
        初始化商品
     */
    static func initShopView() -> ShopView {
        return ShopView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let goodsImg = UIImageView()
        self.goodsImg = goodsImg
        
        let goodsLabel = UILabel()
        goodsLabel.textAlignment = .Center
        self.goodsLabel = goodsLabel
        
        self.addSubview(goodsImg)
        self.addSubview(goodsLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let width = self.frame.width
        let height = self.frame.height
        
        self.goodsImg?.frame = CGRectMake( 0, 0, width, width)
        self.goodsLabel?.frame = CGRectMake(0, width, width, height - width)
        
    }


}
