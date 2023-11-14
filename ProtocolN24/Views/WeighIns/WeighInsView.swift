//
//  WeighInsView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftData
import SwiftUI

struct WeighInsView: View {
    
    var body: some View {
        NavigationView {
            List{
                AddWeighInView()
                SeriesChartView()
                Week4ChartView()
                WeightWeekView()
                WeighInDataView()
            }
            .navigationTitle("Progress")
        }
    }
}

struct AddWeighInView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WeighIn.weekOfYear) var weighIns: [WeighIn]
    var calendar = Calendar(identifier: .gregorian)
    
    @State private var dateToAdd = Date.now
    @State private var weightToAdd: Double = 85.1
    
    var weekInYear: Int {
        return calendar.component(.weekOfYear, from: dateToAdd)
    }
    
    var body: some View {
        Section("Add Weight") {
            
            DatePicker(selection: $dateToAdd, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
            
            Stepper("\(weightToAdd.formatted()) kg",
                    value: $weightToAdd,
                    in: 40...300, step: 0.1)
            
            HStack {
                Button("Add Weight") { addWeighIn() }
                Spacer()
                Text("Week: \(weekInYear)")
            }
            
            HStack {
                Text("Day of Week: \(calendar.component(.weekday, from: dateToAdd))")
                Spacer()
                Button("Sample Data") { addSampleData() }
            }
        }.onAppear{
            if weighIns.count > 0 {
                //weightToAdd = weighIns[weighIns.count-1].weight
                weightToAdd = 82
            }
        }
    }
    
    func addWeighIn() {
        let newWeighIn = WeighIn(weekOfYear: calendar.component(.weekOfYear, from: dateToAdd),
                                 dayOfWeek: calendar.component(.weekday, from: dateToAdd),
                                 weight: weightToAdd,
                                 date: dateGet(year: calendar.component(.year, from: dateToAdd),
                                               month: calendar.component(.month, from: dateToAdd),
                                               day: calendar.component(.day, from: dateToAdd)))
        modelContext.insert(newWeighIn)
        try? modelContext.save()
    }
    
    func addSampleData() {
        let wI1 = WeighIn(weekOfYear: calendar.component(.weekOfYear, from: dateToAdd),
                          dayOfWeek: 1, weight: 85.1,
                          date: dateGet(year: 2023, month: 11, day: 12))
        let wI2 = WeighIn(weekOfYear: calendar.component(.weekOfYear, from: dateToAdd),
                          dayOfWeek: 3, weight: 85.2,
                          date: dateGet(year: 2023, month: 11, day: 12))
        let wI3 = WeighIn(weekOfYear: calendar.component(.weekOfYear, from: dateToAdd),
                          dayOfWeek: 4, weight: 85.3,
                          date: dateGet(year: 2023, month: 11, day: 12))
        let wI4 = WeighIn(weekOfYear: calendar.component(.weekOfYear, from: dateToAdd),
                          dayOfWeek: 6, weight: 85.4,
                          date: dateGet(year: 2023, month: 11, day: 12))
        let wI5 = WeighIn(weekOfYear: calendar.component(.weekOfYear, from: dateToAdd),
                          dayOfWeek: 7, weight: 85.5,
                          date: dateGet(year: 2023, month: 11, day: 12))
        
        modelContext.insert(wI1)
        modelContext.insert(wI2)
        modelContext.insert(wI3)
        modelContext.insert(wI4)
        modelContext.insert(wI5)
        
        try? modelContext.save()
    }
    
    func dateGet(year: Int, month: Int, day: Int = 1) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
    }
}

struct WeightWeekView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WeighWeek.weekRef) var weeks: [WeighWeek]
    var calendar = Calendar(identifier: .gregorian)
    @State var selectedWeek: WeighWeek = WeighWeek(weekRef: 0)
   
    var body: some View {
        Section("Week Chart: \(calendar.component(.weekOfYear, from: .now))") {
            WeightWeekViewChartView(week: calendar.component(.weekOfYear, from: .now))
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: WeighIn.self, configurations: config)
        
        return WeighInsView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
