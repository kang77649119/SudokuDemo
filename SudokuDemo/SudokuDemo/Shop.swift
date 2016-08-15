//
//  Shop.swift
//  SudokuDemo
//
//  Created by 也许、 on 16/8/15.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class Shop: NSObject {
    
    var icon:String?
    
    var name:String?
    
    /**
        字典转模型
     */
    static func ShopInitWithDict(dict:NSDictionary) -> Shop {
        return Shop().initModelWithDict(dict)
    }
    
    func initModelWithDict(dict:NSDictionary) -> Shop {
        self.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
        return self
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

}
