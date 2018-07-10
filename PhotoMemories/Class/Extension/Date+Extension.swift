//
//  Date+Extension.swift
//  Vietnam News
//
//  Created by nguyen.manh.tuanb on 7/2/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation

extension Date {
    
    func getTimesFromNow() -> String {
        let now = Date()
        let calendar = NSCalendar.current
        
        if let month = calendar.dateComponents([.month], from: self, to: now).month {
            if month == 1 {
                return "tháng trước"
            } else if month > 1 {
                return "\(month) tháng trước"
            }
        }
        
        if let days = calendar.dateComponents([.day], from: self, to: now).day {
            if days == 1 {
                return "hôm qua"
            } else if days > 1 {
                return "\(days) ngày trước"
            }
        }
        
        if let hours = calendar.dateComponents([.hour], from: self, to: now).hour {
            if hours == 1 {
                return "1 giờ trước"
            } else if hours > 1 {
                return "\(hours) giờ trước"
            }
        }
        
        if let minutes = calendar.dateComponents([.minute], from: self, to: now).minute {
            if minutes > 4 {
                return "\(minutes) phút trước"
            }
        }
        return "vừa xong"
    }
    
    func getHour() -> String {
        let format = DateFormatter()
        format.timeZone = TimeZone(identifier: "UTC")
        format.dateFormat = "HH"
        return format.string(from: self)
    }
    
    func localToUTC() -> Date {
        let utc = TimeZone(identifier: "UTC")!
        let targetOffset = TimeInterval(utc.secondsFromGMT(for: self))
        let localOffeset = TimeInterval(TimeZone.autoupdatingCurrent.secondsFromGMT(for: self))
        return self.addingTimeInterval(localOffeset - targetOffset)
    }
    
    func toString() -> String {
        let weekday = Calendar.current.component(.weekday, from: self)
        var weekdayStr = ""
        switch weekday {
        case 1:
            weekdayStr = "Chủ nhật"
        case 2:
            weekdayStr = "Thứ hai"
        case 3:
            weekdayStr = "Thứ ba"
        case 4:
            weekdayStr = "Thứ tư"
        case 5:
            weekdayStr = "Thứ năm"
        case 6:
            weekdayStr = "Thứ sáu"
        case 7:
            weekdayStr = "Thứ bảy"
        default:
            break
        }

        let day = Calendar.current.component(.day, from: self)
        let month = Calendar.current.component(.month, from: self)
        let year = Calendar.current.component(.year, from: self)

        return "\(weekdayStr), \(day) tháng \(month) năm \(year)"
    }
    
    func isNight() -> Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 5 || hour > 18 {
            return true
        }
        return false
    }
}
