//
//  Date+formattedDate.swift
//  
//
//

import Foundation

public extension Date {
    func formattedDate() -> String {
        let now = Date()
        let calendar = Calendar.current
        
        if self <= now {
            return "AGORA"
        }
        
        let dateFormatter = DateFormatter()
        if calendar.isDateInToday(self) {
            dateFormatter.dateFormat = "HH:mm"
            return "Hoje, \(dateFormatter.string(from: self))"
        }
        
        if calendar.isDateInTomorrow(self) {
            dateFormatter.dateFormat = "HH:mm"
            return "Amanhã, \(dateFormatter.string(from: self))"
        }
        
        if let nextWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: now),
           let endOfNextWeek = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: nextWeek),
           self <= endOfNextWeek {
            dateFormatter.dateFormat = "E, HH:mm"
            return dateFormatter.string(from: self)
        }
        
        dateFormatter.dateFormat = "dd.MM, HH:mm"
        return dateFormatter.string(from: self)
    }
}
