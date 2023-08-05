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
        
        dateFormatter.dateFormat = "E, HH:mm"
        return dateFormatter.string(from: self)
    }
}
