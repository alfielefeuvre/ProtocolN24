//
//  DailyData.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/07/2024.
//

import Foundation
import SwiftData

@Model
class DayData: Comparable {
   
    var date: Date = Date()
    var weight: Double = 0
    var calories: Double = 0
    var proteins: Double = 0
    var fats: Double = 0
    var carbs: Double = 0
    
    init(date: Date, weight: Double, calories: Double, proteins: Double, fats: Double, carbs: Double) {
        self.date = date
        self.weight = weight
        self.calories = calories
        self.proteins = proteins
        self.fats = fats
        self.carbs = carbs
    }
    
    static func <(lhs: DayData, rhs: DayData) -> Bool {
        return lhs.date < rhs.date
    }
}
