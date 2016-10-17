//
//  StringExtension.swift
//  HupunErp
//
//  Created by 何文新 on 15/4/20.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import UIKit

/**
 多语言的缩写函数
 
 - parameter key:	key
 
 - returns: <#return value description#>
 */
public func LS(_ key:String) -> String {
    return NSLocalizedString(key, comment: "")
}

extension String {
    
    func labelSizeWithFont(_ fontSize:CGFloat, maxSize:CGSize) -> CGSize {
        let size = NSString(string: self).boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: fontSize)], context: nil).size
        
        return CGSize(width: ceil(size.width), height: ceil(size.height))
    }
    
    // MARK: - sub String
    func substringToIndex(_ index:Int) -> String {
        return self.substring(to: self.characters.index(self.startIndex, offsetBy: index))
    }
    func substringFromIndex(_ index:Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: index))
    }
    func substringWithRange(_ range:Range<Int>) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.characters.index(self.startIndex, offsetBy: range.upperBound)
        return self.substring(with: start..<end)
    }
    
    public subscript(index:Int) -> String {
        return String(self[self.characters.index(self.startIndex, offsetBy: index)])
    }
    
    public subscript(range:Range<Int>) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.characters.index(self.startIndex, offsetBy: range.upperBound)
        return self[start..<end]
    }
    
    func cloneSelf(_ times:Int) -> String {
        if times <= 0 {
            return self
        }
        let str = self
        var result = str
        for _ in 1..<times {
            result += str
        }
        return result
    }
    
    func charLength() -> Int {
        var length = 0
        for char in self.unicodeScalars {
            length += char.value >= 0x0391 && char.value <= 0xffe5 ? 2 : 1
        }
        return length
    }
    
    
    // MARK: - replace
    func replaceCharactersInRange(_ range:Range<Int>, withString: String!) -> String {
        let result:NSMutableString = NSMutableString(string: self)
        result.replaceCharacters(in: NSRange(range), with: withString)
        return result as String
    }
}
