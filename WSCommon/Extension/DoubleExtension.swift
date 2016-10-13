//
//  DoubleExtension.swift
//  WesinCommon
//
//  Created by 何文新 on 2016/10/13.
//  Copyright © 2016年 wesin. All rights reserved.
//

import Foundation

extension Double {
    
    /// 获取double的四舍五入小数位
    ///
    /// - Parameter digit: 几位小数
    /// - Returns: 99999999.65356767.rounded(digit: 2)
    func rounded(digit:Int) -> Double {
        return  (self * pow(Double(10), Double(digit))).rounded() / pow(Double(10), Double(digit))
    }
    
    
    /// 获取double的四舍五入小数位字符串
    ///
    /// - Parameter digit: 几位小数
    /// - Returns: string
    func formatRounded(digit:Int) -> String {
        return String(format: "%\(digit)f", rounded(digit: digit))
    }

}
