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
    var calories: Int = 0
    var protein: Int = 0
    var fat: Int = 0
    var carbs: Int = 0
    
    // start at week 1
    var weeksIn = 1
    
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
    
    var lostWeight: String {
        let lostKG = startWeightKGDouble - recentAvgBodyweightKG
        return String(format: "%.1f", lostKG) + " kg"
    }
    
    var lostWeightPercent: String {
        var lostKGPercent = (startWeightKGDouble - recentAvgBodyweightKG) * 100 / startWeightKGDouble
        if startWeightKGDouble == 0 { lostKGPercent = 1 }
        return String(format: "%.1f", lostKGPercent) + " %"
    }
    
    var forecastLostWeight: String {
        let lossPerWeek = (startWeightKGDouble - recentAvgBodyweightKG) / Double(weeksIn)
        let lossIn8Weeks = 8 * lossPerWeek
        return String(format: "%.1f", lossIn8Weeks) + " kg"
    }
            
    var forecastLostWeightPercent: String {
        let lossPerWeek = (startWeightKGDouble - recentAvgBodyweightKG) / Double(weeksIn)
        let lossIn8Weeks = 8 * lossPerWeek
        let lossIn8Percent = lossIn8Weeks * 100 / startWeightKGDouble
        return String(format: "%.1f", lossIn8Percent) + " %"
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
