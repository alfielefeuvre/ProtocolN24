//
//  AppController.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class AppController: NSObject, ObservableObject {
    
    @Published var lessons: [Lesson] = []
    @Published var modules: [String] = ["Week 1", "Week 2", "Week 3"]
    
    // MARK: - Set-up
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
        lessons.sort { $0.id < $1.id }
    }
        
    // MARK: - Navigation
    @Published var readyForNextLesson = false
    func resetReadyForNextLesson() { readyForNextLesson = false }
    func nowReadyForNextLesson() { readyForNextLesson = true }

    
    
    // MARK: - Demo
    let demoLesson = Lesson(id: 010, dayRef: "Lesson 1",
                              headlineText: "What you will get out the programme",
                              subHeadline: "Focused on results",
                              tenTextStrings: ["One1", "xx2", "3", "xx4", "5", "xx6", "7", "xx8", "9", "10"],
                              tenImageStrings: ["run-634702_1920", "xx2", "run-634702_1920", "xx4", "xx5", "xx6", "xx7", "xx8", "run-634702_1920", "xx10"],
                              tenQuestions: ["Q1. Question 1?", "xxQ2. Question 2?", "xxQ3. Question 3?", "xxQ4", "xxQ5", "xQ6", "xQ7", "xQ8", "xQ9", "xQ10"],
                              tenAnswers: ["One1", "xxA2", "xx3", "xxA4", "xx5", "xA6", "7", "xA8", "9", "10"],
                              module: .week1,
                            imageName: "run-634702_1920",
                            uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                       uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6, 
                                                                                       uiSegPickerOptions: ["xx"],
                                                                                       uiQuestion: "xx", uiAnswer: "xx")),
                                           
                                           UIComponent(type: .uiImageName, uiData: UIData(uiText: "String from App Demo Data", uiText2: "UI Text No.2",
                                                                                          uiImage: "Gym", ratioOfDeviceWidth: 0.5, imageRatio: 1, 
                                                                                          uiSegPickerOptions: ["xx"],
                                                                                          uiQuestion: "App Demo Q1", uiAnswer: "App Demo A1")),
                                           
                                           UIComponent(type: .uiSegPicker, uiData: UIData(uiText: "Select your setting...", uiText2: "Lesson 1",
                                                                                          uiImage: "Gym", ratioOfDeviceWidth: 0, imageRatio: 0, 
                                                                                          uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"],
                                                                                          uiQuestion: "xx", uiAnswer: "xx")),
                                           
                                           UIComponent(type: .uiNextLesson, uiData: UIData(uiText: "String 22from App Demo Data", uiText2: "UI Text 22 ",
                                                                                           uiImage: "Bench", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                           uiSegPickerOptions: ["xx"],
                                                                                           uiQuestion: "xx", uiAnswer: "xx"))
                                          
                                          ])
}
