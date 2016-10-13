//
//  IntExtension.swift
//  WesinCommon
//
//  Created by 何文新 on 2016/10/13.
//  Copyright © 2016年 wesin. All rights reserved.
//

import Foundation


extension Int {
    
    /**
     获取byte存储的Int型
     
     - parameter length:	byte长度 不能大于7位，否则超过int最大值
     
     - returns: byte数组， Data可以从byte生成
     */
    func getBytes(_ length:Int) -> [UInt8]? {
        if length >= 8 {
            return nil
        }
        var bytes = [UInt8]()
        for i in 1...length {
            bytes.append((UInt8)(((self & (0xff * Int(pow(Double(16), Double(2 * (length - i)))))) >> ((length - i) * 8))))
        }
        return bytes
    }
    
}
