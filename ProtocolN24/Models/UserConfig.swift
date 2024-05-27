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
    var startBodyweightKG: Int = 0
    var calories: Int = 0
    var protein: Int = 0
    var fat: Int = 0
    var carbs: Int = 0
    
    init(isLessonComplete: [Int : Bool],
         isLessonLocked: [Int : Bool],
         cutOrBulk: String,
         startBodyweightKG: Int,
         calories: Int,
         protein: Int,
         fat: Int,
         carbs: Int
    ) {
        self.isLessonComplete = isLessonComplete
        self.isLessonLocked = isLessonLocked
        self.cutOrBulk = cutOrBulk
        self.startBodyweightKG = startBodyweightKG
        self.calories = calories
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
    }
}
