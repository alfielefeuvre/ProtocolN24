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
    
    @Published var expectedWeightLoss = 0.0
    
//    @Published var demoWeighInData = [
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.5,
//                date: dateGet(year: 2024, month: 7, day: 8)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.9,
//                date: dateGet(year: 2024, month: 7, day: 9)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.6,
//                date: dateGet(year: 2024, month: 7, day: 10)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.2,
//                date: dateGet(year: 2024, month: 7, day: 11)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.0,
//                date: dateGet(year: 2024, month: 7, day: 12)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.1,
//                date: dateGet(year: 2024, month: 7, day: 13)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.8,
//                date: dateGet(year: 2024, month: 7, day: 14)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.7,
//                date: dateGet(year: 2024, month: 7, day: 15)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.5,
//                date: dateGet(year: 2024, month: 7, day: 16)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.8,
//                date: dateGet(year: 2024, month: 7, day: 17)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.3,
//                date: dateGet(year: 2024, month: 7, day: 18)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.5,
//                date: dateGet(year: 2024, month: 7, day: 19)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.2,
//                date: dateGet(year: 2024, month: 7, day: 20)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.3,
//                date: dateGet(year: 2024, month: 7, day: 21))
//    ]
    

    
    // MARK: - Set-up
    func loadLessonsFromStorage() {
        lessons.append(Lesson000().lesson000)
        lessons.append(Lesson010().lesson010)
        lessons.append(Lesson020().lesson020)
        lessons.append(Lesson030().lesson030)
        lessons.append(Lesson040().lesson040)
        lessons.append(Lesson045().lesson045)
        lessons.append(Lesson050().lesson050)
        lessons.append(Lesson060().lesson060)
        lessons.append(Lesson070().lesson070)
        lessons.append(Lesson080().lesson080)
        lessons.append(Lesson090().lesson090)
        lessons.sort { $0.id < $1.id }
    }
    
    func updateLessonsWithUserConfig(userConfig: UserConfig) {
        for index in (0...lessons.count-1) {
            let isCompleted = userConfig.isLessonComplete[lessons[index].id]
            if isCompleted == true { lessons[index].isComplete = true
            } else { lessons[index].isComplete = false }
            
            let isLocked = userConfig.isLessonLocked[lessons[index].id]
            if isLocked == true { lessons[index].isLocked = true
            } else { lessons[index].isLocked = false }
        }
        expectedWeightLoss = Double(userConfig.recentAvgBodyweightKG) * 0.06
    }
   
    
    // MARK: - Demo
    let demoLesson = Lesson(id: 090, headline: "Headline", dayRef: "Lesson 1",
                            module: .week1,
                            isComplete: false,  isLocked: false, imageName: "Gym",
                            uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                       uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6, 
                                                                                       uiSegPickerOptions: ["xx"])),
                                           
                                           UIComponent(type: .uiImageName, uiData: UIData(uiText: "String from App Demo Data", uiText2: "UI Text No.2",
                                                                                          uiImage: "Gym", ratioOfDeviceWidth: 0.5, imageRatio: 1, 
                                                                                          uiSegPickerOptions: ["xx"])),
                                           
                                           UIComponent(type: .uiSegPicker, uiData: UIData(uiText: "Select your setting...", uiText2: "Lesson 1",
                                                                                          uiImage: "Gym", ratioOfDeviceWidth: 0, imageRatio: 0, 
                                                                                          uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"]))
                                          ])
}
