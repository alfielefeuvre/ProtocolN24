//
//  FoodView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/06/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct FoodView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DayData.date) var dailyData: [DayData]
        
    var body: some View {
        NavigationView {
            List {
                AddMacros()
                DailyChart(dataToDisplay: dailyData)
                ListMacros()
            }.navigationTitle("Food & Drink")
        }
    }
}

#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: DayData.self, configurations: config)
//    
//        let day1 = DayData(date: Date.getDate(year: 2024, month: 07, day: 21), weight: 78.5, calories: 2009, proteins: 183, fats: 43, carbs: 223)
//        let day2 = DayData(date: Date.getDate(year: 2024, month: 07, day: 22), weight: 78.8, calories: 1826, proteins: 158, fats: 58, carbs: 167)
//        let day3 = DayData(date: Date.getDate(year: 2024, month: 07, day: 23), weight: 78.8, calories: 1921, proteins: 153, fats: 74, carbs: 147)
//        let day4 = DayData(date: Date.getDate(year: 2024, month: 07, day: 24), weight: 78.2, calories: 1724, proteins: 178, fats: 43, carbs: 157)
//        let day5 = DayData(date: Date.getDate(year: 2024, month: 07, day: 25), weight: 78.1, calories: 1713, proteins: 179, fats: 41, carbs: 158)
//        let day6 = DayData(date: Date.getDate(year: 2024, month: 07, day: 26), weight: 77.8, calories: 1746, proteins: 177, fats: 40, carbs: 169)
//        let day7 = DayData(date: Date.getDate(year: 2024, month: 07, day: 27), weight: 77.8, calories: 2003, proteins: 176, fats: 75, carbs: 156)
//        let day8 = DayData(date: Date.getDate(year: 2024, month: 07, day: 28), weight: 77.3, calories: 1800, proteins: 177, fats: 40, carbs: 181)
//        let dailyData = [day1, day2, day3, day4, day5, day6, day7, day8]
//    
////    container.mainContext.insert(dailyData)
////    
//    return 
    
    FoodView()
         .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
      
}
