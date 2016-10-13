//
//  UISearchBarExtension.swift
//  WesinCommon
//
//  Created by 何文新 on 2016/10/13.
//  Copyright © 2016年 wesin. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    /// 设置UISearchBar的输入框背景颜色
    ///
    /// - Parameter color: 颜色
    func setFieldColor(_ color:UIColor) {
        let field = self.subviews[0].subviews.last as! UITextField
        field.backgroundColor = color
    }
}
