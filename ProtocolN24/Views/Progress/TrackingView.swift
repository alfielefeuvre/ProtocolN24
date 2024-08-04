//
//  WeighInsView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftData
import SwiftUI

struct TrackingView: View {
    
    @State var weekRef: Int = 0
    @State var weekRefPrevious: Int = 0
    var calendar = Calendar(identifier: .gregorian)
    
    var body: some View {
        NavigationView {
            List{
             //   WeighInChart(includeAverage: false, includeAveragePoint: false)
                FatLossView()
           //     FatStatsView()
                AddWeighInView()
            }
            .navigationTitle("Progress")
        }
        .onAppear{
            weekRef = calendar.component(.weekOfYear, from: Date.now)
            weekRefPrevious = weekRef - 1
            if weekRefPrevious < 1 { weekRefPrevious = 52}
        }
    }
}

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
        }.onAppear{

        }
    }
    
    func addWeighIn() {
        let selectedYear = calendar.component(.year, from: dateToAdd)
        let selectedMonth = calendar.component(.month, from: dateToAdd)
        let selectedDay = calendar.component(.day, from: dateToAdd)
        var indexFound = false
       
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
