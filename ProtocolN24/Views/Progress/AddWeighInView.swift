//
//  AddWeighInView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 11/08/2024.
//
import SwiftData
import SwiftUI

struct AddWeighInView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var dailyData: [DayData]
    
    var calendar = Calendar(identifier: .gregorian)
    
    @State private var dateToAdd = Date.now
    @State private var weightToAdd: Double = 0
    @State private var weightAdded = false
    
    var weekInYear: Int {
        return calendar.component(.weekOfYear, from: dateToAdd)
    }
    
    var body: some View {
        Section("Weigh-in") {
            
            DatePicker(selection: $dateToAdd, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
            
            Stepper("\(weightToAdd.formatted()) kg",
                    value: $weightToAdd,
                    in: 40...300, step: 0.1)
            
            HStack {
                Button("Add Weight") { addWeighIn() }
                    .disabled(weightAdded)
                Spacer()
                Text("Week: \(weekInYear)")
            }
            
            HStack {
                Text("Day of Week: \(calendar.component(.weekday, from: dateToAdd))")
                Spacer()
            }
        }.onAppear{ setupView() }
    }
    
    func setupView() {
        if dailyData.count > 0 {    // there are previous weight measurements
            weightToAdd = dailyData[dailyData.count-1].weight
            
            if weightToAdd < 30 {
                if dailyData.count > 1 {
                    weightToAdd = dailyData[dailyData.count-2].weight
                    
                    if weightToAdd == 0 {
                        weightToAdd = 76
                    }
                }
            }
        } else { weightToAdd = 76 }
    }
    
    func addWeighIn() {
        let selectedYear = calendar.component(.year, from: dateToAdd)
        let selectedMonth = calendar.component(.month, from: dateToAdd)
        let selectedDay = calendar.component(.day, from: dateToAdd)
        var indexFound = false
       
        if dailyData.count > 0 {
            for index in 0...dailyData.count-1 {
                 if calendar.component(.year, from: dailyData[index].date) == selectedYear {
                    if calendar.component(.month, from: dailyData[index].date) == selectedMonth {
                        if calendar.component(.day, from: dailyData[index].date) == selectedDay {
                            indexFound = true
                            dailyData[index].weight = weightToAdd
                        }
                    }
                }
            }
        }
        
        if indexFound == false {
            let newDayData = DayData(date: dateToAdd, weight: weightToAdd,
                                     calories: 0, proteins: 0, fats: 0, carbs: 0)
            modelContext.insert(newDayData)
        }
        try? modelContext.save()
        
        weightAdded = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            weightAdded = false
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return TrackingView()
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
