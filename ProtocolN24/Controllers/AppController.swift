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
    @Published var lessonComplete = false
    func notReadyForNextLesson() { lessonComplete = false }
    func nowReadyForNextLesson() { lessonComplete = true }

    // MARK: - Bulk or Cut
    @Published var bulkOrCut: BulkOrCut = .notSure
    func bulkCutNotSure() { bulkOrCut = .notSure }
    func bulkCutBulk() { bulkOrCut = .bulk }
    func bulkCutCut() { bulkOrCut = .cut }

    enum BulkOrCut: String, CaseIterable, Codable {
        case notSure = "Not Sure"
        case bulk = "Bulk"
        case cut = "Cut"
    }
   
    // Lesson 1 - Bulk or Cut
    func selectCutOrBulk(response: String) {
        print("response: \(response)")
        if response == "Not Sure" {
            bulkCutNotSure()
            notReadyForNextLesson()
        } else if response == "Cut" {
            nowReadyForNextLesson()
            bulkCutCut()
        } else {
            nowReadyForNextLesson()
            bulkCutBulk()
        }
    }
    
    // MARK: - Demo
    let demoLesson = Lesson(id: 010, dayRef: "Lesson 1",
                              headlineText: "What you will get out the programme",
                              subHeadline: "Focused on results",
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
                                                                                          uiQuestion: "xx", uiAnswer: "xx"))
                                          
                                          ])
}
