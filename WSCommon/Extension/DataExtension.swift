//
//  DataExtension.swift
//  WesinCommon
//
//  Created by 何文新 on 2016/10/13.
//  Copyright © 2016年 wesin. All rights reserved.
//

import Foundation


extension Data {
    
    /// 获取某段data的Int值
    ///
    /// - Parameter range: data.intValue(in: 0..<4)
    /// - Returns: int值
    func intValue(in range:Range<Data.Index>) -> Int {
        let data = self.subdata(in: range)
        var value:Int = 0
        for index in 1...data.indices.count {
            value += Int(data[index - 1]) << ((data.indices.count - index) * 8)
        }
        return value
    }
}
