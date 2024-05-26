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
    
    var cutOrBulk = "Not Sure"
    
    
    init(isLessonComplete: [Int : Bool],
         isLessonLocked: [Int : Bool],
         cutOrBulk: String
    ) {
        self.isLessonComplete = isLessonComplete
        self.isLessonLocked = isLessonLocked
        self.cutOrBulk = cutOrBulk
    }
}
