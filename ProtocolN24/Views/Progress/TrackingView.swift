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
                FatLossView()
                ScreenshotView()
                AddWeighInView()
//                ProgressSummaryView()
////                SeriesChartView(weekRef: weekRef)
////                SeriesChartView(weekRef: weekRefPrevious)
//                Week4ChartView()
//                WeighInDataView()
            }
            .navigationTitle("Progress")
        }
        .onAppear{
            weekRef = calendar.component(.weekOfYear, from: Date.now)
            weekRefPrevious = weekRef - 1
            if weekRefPrevious < 1 { weekRefPrevious = 52}
            WeighInData.last7Days[1].weighIns[0].weight = 89
        }
    }
}



struct ProgressSummaryView: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
     var body: some View {
         Section("Week: \(userConfig[0].weeksIn)") {
            HStack {
                ProgressItem(titleText: "Weight Loss",
                             kiloWeightLoss: userConfig[0].lostWeight,
                             percentWeightLoss: userConfig[0].lostWeightPercent )
                Spacer()
                ProgressItem(titleText: "8-Week Forecast Weight Loss",
                             kiloWeightLoss: userConfig[0].forecastLostWeight,
                             percentWeightLoss: userConfig[0].forecastLostWeightPercent )
            }
        }
    }
}

struct ProgressItem: View {
    let squareWidth = UIScreen.main.bounds.width * 0.95 / 2.3
    let titleText: String
    let kiloWeightLoss: String
    let percentWeightLoss: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                .foregroundColor(.primary)
                .opacity(0.03)
                .frame(width: squareWidth, height: squareWidth)
            
            VStack {
                Text(titleText).padding(.top)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Text(kiloWeightLoss)
                       .padding(.leading)
                    Spacer()
                }
                Text("")
                HStack {
                    Spacer()
                    Text(percentWeightLoss)
                        .padding(.trailing)
                }
            }
            .font(.largeTitle)
            .padding(.bottom)
        }
    }
}


struct AddWeighInView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WeighIn.weekOfYear) var weighIns: [WeighIn]
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
            if weighIns.count > 0 {
                weightToAdd = 79
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
        
        weightAdded = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            weightAdded = false
        }
    }
    
    func dateGet(year: Int, month: Int, day: Int = 1) -> Date {
        Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
    }
}

//struct WeightWeekView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query(sort: \WeighWeek.weekRef) var weeks: [WeighWeek]
//    var calendar = Calendar(identifier: .gregorian)
//    @State var selectedWeek: WeighWeek = WeighWeek(weekRef: 0)
//   
//    var body: some View {
//        Section("Week Chart: \(calendar.component(.weekOfYear, from: .now))") {
//            WeightWeekViewChartView(week: calendar.component(.weekOfYear, from: .now))
//        }
//    }
//}

#Preview {
    
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])

}
