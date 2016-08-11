//
//  ViewController.swift
//  SudokuDemo
//
//  Created by 也许、 on 16/8/11.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenW = UIScreen.mainScreen().bounds.width
    
    @IBOutlet weak var shoppingCartView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buyGoods(sender: UIButton) {
        
        // 每行元素个数
        let rowCount = 3
        
        // 元素宽
        let goodsViewW:CGFloat = 70
        
        // 元素高
        let goodsViewH:CGFloat = 90
        
        // 元素距左边距
        let goodsViewLeftMargin:CGFloat = 10
        
        // 购物车中元素个数
        let goodsCount = self.shoppingCartView.subviews.count
        
        // 元素间距
        let margin = (screenW - goodsViewLeftMargin * 2 - CGFloat(rowCount) * goodsViewW)  / (CGFloat(rowCount - 1))
        
        // 元素X坐标 （取模）
        let goodsViewX:CGFloat = CGFloat(goodsCount % rowCount) * (goodsViewW + margin) + goodsViewLeftMargin
        
        // 元素Y坐标 （取余）
        let goodsViewY:CGFloat = CGFloat(goodsCount / rowCount) * (goodsViewH + goodsViewLeftMargin)
        
        // 生成商品
        let frame = CGRectMake(goodsViewX, goodsViewY, goodsViewW, goodsViewH)
        createGoodsView(frame)
        
    }
    
    /**
        生成商品
     */
    func createGoodsView(frame:CGRect) {
        
        let goodsView = UIView(frame: CGRectMake( frame.origin.x , frame.origin.y, frame.size.width, frame.size.height))
        let goodsImg = UIImageView(image: UIImage(named: "iphone"))
        goodsImg.frame = CGRectMake(0, 0, frame.size.width, frame.size.width)
        
        let goodsLabel = UILabel(frame: CGRectMake( 0, frame.size.width, frame.size.width, frame.size.height - frame.size.width))
        goodsLabel.text = "iPhone"
        
        goodsView.addSubview(goodsImg)
        goodsView.addSubview(goodsLabel)
        
        self.shoppingCartView.addSubview(goodsView)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

