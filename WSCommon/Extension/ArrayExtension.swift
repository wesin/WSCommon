//
//  ArrayExtension.swift
//  SwiftEasyStock
//
//  Created by 何文新 on 15/2/20.
//  Copyright (c) 2015年 wesin. All rights reserved.
//

import Foundation

extension Array {
    
    public func find(_ fn: (Element) -> Bool) -> Int {
        for (index,x) in self.enumerated() {
            if fn(x) {
                return index
            }
        }
        return -1
    }
    
    public func findElement(_ fn:(Element) -> Bool) -> Element? {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return nil
    }
    
    mutating func removeItem(_ fn:(Element) -> Bool) {
        let index = self.find(fn)
        if index != -1 {
            self.remove(at: index)
        }
    }
    
    mutating func addByFilter(_ e:Element, fn:(Element) -> Bool) {
        if fn(e) {
            self.append(e)
        }
    }
    
    mutating func addNotExitItem(_ e:Element, fn:(Element) -> Bool) {
        if self.find(fn) == -1 {
            self.append(e)
        }
    }
    
}

extension Array where Element:Equatable {
    /**
     获取数组交集
     
     - parameter otherArr:	另外一个数组
     
     - returns: 新数组
     */
    public func interSection<S : Sequence>(_ otherArr:S) -> [Element] where S.Iterator.Element == _Buffer.Element {
        var newArr = [Element]()
        for item in otherArr {
            if self.contains(item) {
                newArr.append(item)
            }
        }
        return newArr
    }
}
