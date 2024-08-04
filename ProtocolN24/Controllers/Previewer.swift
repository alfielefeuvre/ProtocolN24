//
//  Previewer.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 04/08/2024.
//
import SwiftData
import Foundation

@MainActor
struct Previewer {
    let container: ModelContainer
    let dataToDisplay: [DayData] = []

    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: UserConfig.self, DayData.self, configurations: config)

        let userConfig = UserConfig(isLessonComplete: [ 010 : false ],
                                    isLessonLocked: [ 10: false ],
                                    cutOrBulk: "Not Sure",
                                    startWeightKGDouble: 0,
                                    recentAvgBodyweightKG: 0,
                                    calories: 0, protein: 0, fat: 0, carbs: 0)
        
        container.mainContext.insert(userConfig)
        
        // DayData Set-up
        let day1 = DayData(date: Date.getDate(year: 2024, month: 07, day: 21), weight: 78.5, calories: 2009, proteins: 183, fats: 43, carbs: 223)
        let day2 = DayData(date: Date.getDate(year: 2024, month: 07, day: 22), weight: 78.8, calories: 1826, proteins: 158, fats: 58, carbs: 167)
        let day3 = DayData(date: Date.getDate(year: 2024, month: 07, day: 23), weight: 78.8, calories: 1921, proteins: 153, fats: 74, carbs: 147)
        let day4 = DayData(date: Date.getDate(year: 2024, month: 07, day: 24), weight: 78.2, calories: 1724, proteins: 178, fats: 43, carbs: 157)
        let day5 = DayData(date: Date.getDate(year: 2024, month: 07, day: 25), weight: 78.1, calories: 1713, proteins: 179, fats: 41, carbs: 158)
        let day6 = DayData(date: Date.getDate(year: 2024, month: 07, day: 26), weight: 77.8, calories: 1746, proteins: 177, fats: 40, carbs: 169)
        let day7 = DayData(date: Date.getDate(year: 2024, month: 07, day: 27), weight: 77.8, calories: 2003, proteins: 176, fats: 75, carbs: 156)
        let day8 = DayData(date: Date.getDate(year: 2024, month: 07, day: 28), weight: 77.3, calories: 1800, proteins: 177, fats: 40, carbs: 181)
        let dataToDisplay = [day1, day2, day3, day4, day5, day6, day7, day8 ]
        
        for dayInfo in dataToDisplay {
            container.mainContext.insert(dayInfo)
        }
    }
}
