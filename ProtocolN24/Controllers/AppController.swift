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
    
    let next14DCStarts: Date = Date.getDate(year: 2024, month: 10, day: 12) + (8 * 3_600)
    
    let lesson3ChartData: [DayData] = [
        DayData(date: Date.getDate(year: 2024, month: 01, day: 01), weight: 100, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 02), weight: 100.2, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 03), weight: 100, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 04), weight: 100.3, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 05), weight: 99.9, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 06), weight: 100.2, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 07), weight: 100.2, calories: 3000, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 08), weight: 99.8, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 09), weight: 99.9, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 10), weight: 99.5, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 11), weight: 99.9, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 12), weight: 99.1, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 13), weight: 99.6, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 14), weight: 98.7, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 15), weight: 99.1, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 16), weight: 98.5, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 17), weight: 98.9, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 18), weight: 98.2, calories: 2500, proteins: 175, fats: 41, carbs: 176),
        DayData(date: Date.getDate(year: 2024, month: 01, day: 19), weight: 98.6, calories: 2500, proteins: 175, fats: 41, carbs: 176)
    ]
    
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
        lessons.append(Lesson100().lesson100)
        lessons.append(Lesson110().lesson110)
        lessons.append(Lesson120().lesson120)
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
