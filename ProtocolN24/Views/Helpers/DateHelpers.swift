//
//  DateHelpers.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 03/07/2024.
//

import Foundation
import SwiftUI

var calendar = Calendar(identifier: .gregorian)

extension Date {
    static func fromString(_ dateString: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: dateString) {
            return date
        }
        return nil
    }
    
    static func getDate(year: Int, month: Int, day: Int = 1) -> Date {
       Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
    }
    
    static func getDay(date: Date) -> Int {
        return calendar.component(.day, from: date)
    }
    
    static func getMonth(date: Date) -> String {
        let monthNumber = calendar.component(.month, from: date)
        
        switch monthNumber {
        case 1: return "Jan"
        case 2: return "Feb"
        case 3: return "Mar"
        case 4: return "Apr"
        case 5: return "May"
        case 6: return "Jun"
        case 7: return "Jul"
        case 8: return "Aug"
        case 9: return "Sep"
        case 10: return "Oct"
        case 11: return "Nov"
        default: return "Dec"
        }
    }
    
    static func getYear(date: Date) -> String {
        let year = calendar.component(.year, from: date)
        return String(year)
    }
    
}
