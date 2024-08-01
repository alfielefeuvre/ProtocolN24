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
    

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    @FocusState private var isFocused: Bool
 
    var body: some View {
        Section("Add Macros") {
            DatePicker(selection: $dateToAdd, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }.onTapGesture{ isFocused = false }
            
            HStack {
                Text("Calories (cal):")
                Spacer()
                TextField("", value: $caloriesToAdd, formatter: formatter)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 125)
                    .focused($isFocused)
            }
            
            HStack {
                Text("Protein (g):")
                Spacer()
                TextField("", value: $proteinsToAdd, formatter: formatter)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 125)
                    .focused($isFocused)
            }
            
            HStack {
                Text("Fats (g):")
                Spacer()
                TextField("", value: $fatsToAdd, formatter: formatter)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 125)
                    .focused($isFocused)
            }
            
            HStack {
                Text("Carbs (g):")
                Spacer()
                TextField("", value: $carbsToAdd, formatter: formatter)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 125)
                    .focused($isFocused)
            }
            
            Text("Daily Data Count: \(dailyData.count)").onTapGesture{ isFocused = false }
            HStack {
                Button("Add Macros") { addMacros() }
                    .disabled(dataAdded)
                Spacer()
            }
        }.onAppear{ setupView() }
    }
       
    func setupView() {
        let todayYear = calendar.component(.year, from: .now)
        let todayMonth = calendar.component(.month, from: .now)
        let todayDay = calendar.component(.day, from: .now)
        
        for index in 0...dailyData.count-1 {
            if calendar.component(.year, from: dailyData[index].date) ==  todayYear {
                if calendar.component(.month, from: dailyData[index].date) ==  todayMonth {
                    if calendar.component(.day, from: dailyData[index].date) ==  todayDay {
                        if dailyData[index].calories != 0 { caloriesToAdd = dailyData[index].calories }
                        if dailyData[index].proteins != 0 { proteinsToAdd = dailyData[index].proteins }
                        if dailyData[index].fats != 0 { fatsToAdd = dailyData[index].fats }
                        if dailyData[index].carbs != 0 { carbsToAdd = dailyData[index].carbs }
                  }
                }
            }
        }
      
    }
    
    func addMacros() {
        isFocused = false
        
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
    AddMacros()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
}
