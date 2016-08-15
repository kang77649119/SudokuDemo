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
    
    // 购物车
    @IBOutlet weak var shoppingCartView: UIView!
    
    // 添加按钮
    @IBOutlet weak var addBtn: UIButton!
    
    // 删除按钮
    @IBOutlet weak var deleteBtn: UIButton!
    
    // 懒加载数据
    lazy var shopsData:NSArray? =  {
    
        let plistPath = NSBundle.mainBundle().pathForResource("shops", ofType: "plist")
        
        let array = NSArray(contentsOfFile: plistPath!)
        var shopsArray = NSMutableArray()
        for shopInfo in array! {
            
            // 字典转模型
            let shop = Shop.ShopInitWithDict(shopInfo as! NSDictionary)
            shopsArray.addObject(shop)
            
        }
        return shopsArray
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 监测按钮状态
        checkStatus()
    }
    
    /**
        添加商品
     */
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
        
        // 添加商品
        let goodsObj = self.shopsData![goodsCount] as! Shop
        let goodsFrame = CGRectMake(goodsViewX, goodsViewY, goodsViewW, goodsViewH)
        let shopView = ShopView.initShopView()
        shopView.frame = goodsFrame
        shopView.shop = goodsObj
        self.shoppingCartView.addSubview(shopView)
        
        // 根据购物车中的商品数量检测按钮状态
        checkStatus()
        
    }
    
    /**
        生成商品
     */
    func createGoodsView(frame:CGRect, goodsObj:Shop) {
        
        ShopView.initShopView()
        
        let goodsView = UIView(frame: CGRectMake( frame.origin.x , frame.origin.y, frame.size.width, frame.size.height))
        let goodsImg = UIImageView(image: UIImage(named: goodsObj.icon!))
        goodsImg.frame = CGRectMake(0, 0, frame.size.width, frame.size.width)
        
        let goodsLabel = UILabel(frame: CGRectMake( 0, frame.size.width, frame.size.width, frame.size.height - frame.size.width))
        goodsLabel.textAlignment = .Center
        goodsLabel.text = goodsObj.name!
        
        goodsView.addSubview(goodsImg)
        goodsView.addSubview(goodsLabel)
        
        self.shoppingCartView.addSubview(goodsView)
        
        // 根据购物车中的商品数量控制器 添加按钮状态
        checkStatus()
        
    }
    
    /**
        监测添加按钮状态
     */
    func checkStatus() {
        
        self.addBtn.enabled = (self.shoppingCartView.subviews.count != self.shopsData!.count)
        self.deleteBtn.enabled = self.shoppingCartView.subviews.count > 0
    
    }
    
    /**
        删除商品
     */
    @IBAction func deleteGoods(sender: UIButton) {
        self.shoppingCartView.subviews.last?.removeFromSuperview()
        checkStatus()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

