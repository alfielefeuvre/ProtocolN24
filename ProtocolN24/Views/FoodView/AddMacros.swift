//
//   AddMacros.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/07/2024.
//
import SwiftData
import SwiftUI

struct AddMacros: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query var dailyData: [DayData]
    @Query var userConfig: [UserConfig]
    var calendar = Calendar(identifier: .gregorian)
    
    @State private var dateToAdd = Date.now
    @State private var weightToAdd: Double = 0
    @State private var caloriesToAdd: Double = 1800
    @State private var proteinsToAdd: Double = 175
    @State private var fatsToAdd: Double = 40
    @State private var carbsToAdd: Double = 185
    @State private var dataAdded = false
    
    
    var body: some View {
        Section("Add Macros") {
            DatePicker(selection: $dateToAdd, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
            
            Stepper("Calories: \(caloriesToAdd.formatted()) cal",
                    value: $caloriesToAdd,
                    in: 0...3000, step: 1)
            
            Stepper("Protein: \(proteinsToAdd.formatted())g",
                    value: $proteinsToAdd,
                    in: 0...500, step: 1)
            
            Stepper("Fat: \(fatsToAdd.formatted())g",
                    value: $fatsToAdd,
                    in: 0...500, step: 1)
            
            Stepper("Carbs: \(carbsToAdd.formatted())g",
                    value: $carbsToAdd,
                    in: 0...500, step: 1)
            
            Text("Daily Data Count: \(dailyData.count)")
            HStack {
                Button("Add Macros") { addMacros() }
                    .disabled(dataAdded)
                Spacer()
            }
            
        }
    }
    
    func addMacros() {
        let selectedYear = calendar.component(.year, from: dateToAdd)
        let selectedMonth = calendar.component(.month, from: dateToAdd)
        let selectedDay = calendar.component(.day, from: dateToAdd)
        var indexFound = false
       
        for index in 0...dailyData.count-1 {
             if calendar.component(.year, from: dailyData[index].date) == selectedYear {
                if calendar.component(.month, from: dailyData[index].date) == selectedMonth {
                    if calendar.component(.day, from: dailyData[index].date) == selectedDay {
                        indexFound = true
                        dailyData[index].calories = caloriesToAdd
                        dailyData[index].proteins = proteinsToAdd
                        dailyData[index].fats = fatsToAdd
                        dailyData[index].carbs = carbsToAdd
                    }
                }
            }
        }
        
        if indexFound == false {
            let newDayData = DayData(date: dateToAdd, weight: 0, calories: caloriesToAdd, proteins: proteinsToAdd, fats: fatsToAdd, carbs: carbsToAdd)
            modelContext.insert(newDayData)
        }
        
        try? modelContext.save()
        dataAdded = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) { dataAdded = false }
    }
    
}

#Preview {
    FoodView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
}
