//
//  DateExtension.swift
//  DaySchedule
//
//  Created by 何文新 on 2016/9/29.
//  Copyright © 2016年 wesin. All rights reserved.
//

import Foundation

extension Date {
    
    /// 当前时区时间
    var current:Date {
        let format = DateFormatter()
        format.locale = Locale.current
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let str =  format.string(from: self)
        return format.date(from: str)!
    }
    
    var year:Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }
    
    var month:Int {
        return Calendar.current.component(Calendar.Component.month, from: self)
    }
    
    var day:Int {
        return Calendar.current.component(Calendar.Component.day, from: self)
    }
    
    var isToday:Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var weekday:Int {
        return Calendar.current.component(Calendar.Component.weekday, from: self)
    }
    
    var isWeekend:Bool {
        return [1,7].contains(self.weekday)
    }
    
    func startDate() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    func endDate() -> Date {
        return Calendar.current.startOfDay(for: self.addingDays(1)).addingSeconds(-1)
    }
    
    func addingSeconds(_ second:Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.second, value: second, to: self) ?? self
    }
    
    func addingHours(_ hour:Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.hour, value: hour, to: self) ?? self
    }
    
    func addingYears(_ year:Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.year, value: year, to: self) ?? self
    }
    
    func addingMonths(_ month:Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.month, value: month, to: self) ?? self
    }
    
    func addingDays(_ day:Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.day, value: day, to: self) ?? self
    }
    
    func subtractingDays(_ day:Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.day, value: 0 - day, to: self) ?? self
    }
    
    func years(from:Date) -> Int {
        return Calendar.current.dateComponents([Calendar.Component.year], from: from, to: self).year ?? 0
    }
    
    func months(from:Date) -> Int {
        return Calendar.current.dateComponents([Calendar.Component.month], from: from, to: self).month ?? 0
    }
    
    func days(from:Date) -> Int {
        return Calendar.current.dateComponents([Calendar.Component.day], from: from, to: self).day ?? 0
    }
    
    func hours(from:Date) -> Int {
        return Calendar.current.dateComponents([Calendar.Component.hour], from: from, to: self).day ?? 0
    }
    
    func daysInMonth() -> Int {
        return Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: self)!.count
    }
    
    func formatted(_ formatStr:String) -> String {
        let format = DateFormatter()
        format.locale = Locale.current
        format.dateFormat = formatStr
        return format.string(from: self)
    }
    
    //获取整个月的第一天
    func monthFirstDay() -> Date {
        return self.addingDays(-self.day + 1)
    }
    
    func weekName() -> String {
        let names = Calendar.current.shortStandaloneWeekdaySymbols
        return names[self.weekday - 1]
    }
    
    public func ChangeToInt() -> Int {
        return Int(self.timeIntervalSince1970)
    }
    
    init(serverInterval:TimeInterval) {
        self.init(timeIntervalSince1970: serverInterval / 1000)
    }
    
    static func date(year:Int, month:Int, day:Int) -> Date {
        var component = DateComponents()
        component.calendar = Calendar.current
        component.year = year
        component.month = month
        component.day = day
        return component.date ?? Date()
    }
}
