//
//  UserConfig.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 25/05/2024.
//

import Foundation
import SwiftData

@Model
class UserConfig {
    // Dictionary ["Lesson Id" : isComplete?]
    var isLessonComplete: [Int : Bool] = [:]
    var isLessonLocked: [Int : Bool] = [:]
    
    var cutOrBulk: String = "Not Sure"
    var startWeightKGDouble: Double = 0
    var recentAvgBodyweightKG: Double = 0
    var calories: Int = 1800
    var protein: Int = 175
    var fat: Int = 40
    var carbs: Int = 185
    
    // start at week 1
    var weeksIn = 1
    
    var startDate: Date = Date.getDate(year: 2024, month: 09, day: 20)
    var endDate: Date = Date.getDate(year: 2024, month: 10, day: 15)
    
    init(isLessonComplete: [Int : Bool],
         isLessonLocked: [Int : Bool],
         cutOrBulk: String,
         startWeightKGDouble: Double,
         recentAvgBodyweightKG: Double,
         calories: Int,
         protein: Int,
         fat: Int,
         carbs: Int
    ) {
        self.isLessonComplete = isLessonComplete
        self.isLessonLocked = isLessonLocked
        self.cutOrBulk = cutOrBulk
        self.startWeightKGDouble = startWeightKGDouble
        self.recentAvgBodyweightKG = recentAvgBodyweightKG
        self.calories = calories
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
    }
    
    var lostWeightKg: Double {
        return startWeightKGDouble - recentAvgBodyweightKG
    }
    
    var lostWeightText: String {
        return String(format: "%.1f", lostWeightKg) + " kg"
    }
    
    var lostWeightPercent: Double {
        var lostKGPercent = (startWeightKGDouble - recentAvgBodyweightKG) * 100 / startWeightKGDouble
        if startWeightKGDouble == 0 { lostKGPercent = 1 }
        return lostKGPercent
    }
    
    var lostWeightPercentText: String {
        return String(format: "%.1f", lostWeightPercent) + " %"
    }
    
    var forecastLostWeight: Double {
        let lossPerWeek = (startWeightKGDouble - recentAvgBodyweightKG) / Double(weeksIn)
        return 8 * lossPerWeek
    }
    
    var forecastLostWeightText: String  {
        return String(format: "%.1f", forecastLostWeight) + " kg"
    }
          
    var forecastLostWeightPercent: Double {
        let lossPerWeek = (startWeightKGDouble - recentAvgBodyweightKG) / Double(weeksIn)
        let lossIn8Weeks = 8 * lossPerWeek
        return lossIn8Weeks * 100 / startWeightKGDouble
    }
    
    var forecastLostWeightPercentText: String {
        return String(format: "%.1f", forecastLostWeightPercent) + " %"
    }
    
    func resetData() {
        isLessonComplete = [ 010: false ]
        isLessonLocked = [ 010: false ]
        cutOrBulk = "Not Sure"
        startWeightKGDouble = 0
        recentAvgBodyweightKG = 0
        weeksIn = 1
        calories = 0
        carbs = 0
        protein = 0
        fat = 0
    }
            
}
