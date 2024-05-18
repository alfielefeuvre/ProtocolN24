//
//  AppController.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class AppController: NSObject, ObservableObject {
    
    @Published var lessons: [Lesson] = []
    
    // Set-up
    func setup(){
        
        // Set-up
        lessons.append(Lesson010().lesson010)
        lessons.append(Lesson020().lesson020)
        lessons.append(Lesson030().lesson030)
        lessons.append(Lesson040().lesson040)
        lessons.append(Lesson050().lesson050)
        lessons.append(Lesson060().lesson060)
        lessons.append(Lesson070().lesson070)
        lessons.append(Lesson080().lesson080)
        lessons.append(Lesson090().lesson090)
  
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Demo
    let demoLesson = Lesson(id: 010, shortName: "Lesson 1",
                              headlineText: "What you will get out the programme",
                              subHeadline: "Focused on results",
                              tenTextStrings: ["One1", "xx2", "3", "xx4", "5", "xx6", "7", "xx8", "9", "10"],
                              tenImageStrings: ["run-634702_1920", "xx2", "run-634702_1920", "xx4", "xx5", "xx6", "xx7", "xx8", "run-634702_1920", "xx10"],
                              tenQuestions: ["Q1. Question 1?", "xxQ2. Question 2?", "xxQ3. Question 3?", "xxQ4", "xxQ5", "xQ6", "xQ7", "xQ8", "xQ9", "xQ10"],
                              tenAnswers: ["One1", "xxA2", "xx3", "xxA4", "xx5", "xA6", "7", "xA8", "9", "10"],
                              module: .quickStart,
                              imageName: "run-634702_1920")
}
