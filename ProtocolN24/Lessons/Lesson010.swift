//
//  Lesson010.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson010: NSObject, ObservableObject {
    
    let lesson010 = Lesson(id: 010,
                           dayRef: "Day 1 (1/3)",
                           headlineText: "What will ProtocolN24 do for me?",
                           subHeadline: "Lesson010",
                           tenTextStrings: ["One1", "xx2", "3", "xx4", "5", "xx6", "7", "xx8", "9", "10"],
                           tenImageStrings: ["run-634702_1920", "xx2", "run-634702_1920", "xx4", "xx5", "xx6", "xx7", "xx8", "run-634702_1920", "xx10"],
                           tenQuestions: ["Q1. Question 1?", "xxQ2", "xxQ3", "xxQ4", "xxQ5", "xxQ6", "xxQ7", "xxQ8", "xxQ9", "xxQ10"],
                           tenAnswers: ["Answer 1", "xxA2", "xx3", "xxA4", "xx5", "xxA6", "xxA7", "xxA8", "xxA9", "xxA10"],
                           module: .week1,
                           imageName: "run-634702_1920")
    
}
