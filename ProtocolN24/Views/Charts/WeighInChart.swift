//
//  WeighInChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 08/07/2024.
//
import Charts
import Foundation
import SwiftUI
import SwiftData

struct WeighInChart: View {
    @EnvironmentObject var appController: AppController
    
    let includeAverage = true
    @State private var weighInSeries = WeighInSeries()
    @State private var averageSeries = WeighInSeries()
    @State private var chartSeries = [WeighInSeries]()
    
     var body: some View {
         ZStack {
             Chart {
                 ForEach(chartSeries) { series in
                     ForEach(series.weighIns, id: \.date) { element in
                         PointMark(
                            x: .value("Day", element.date, unit: .day),
                            y: .value("Sales", element.weight)
                         ).opacity(series.name == "Average" ? 0 : 1)
                         LineMark(
                             x: .value("Day", element.date, unit: .day),
                             y: .value("Sales", element.weight)
                         ).opacity(series.name == "Average" ? 1 : 0)
                     }
                     .foregroundStyle(by: .value("Series", series.name))
                 }
             }
             .chartXAxis {
                 AxisMarks(values: .stride(by: .day)) { _ in
                     AxisTick()
                     AxisGridLine()
                     AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                 }
             }
             .chartYScale(domain: [78, 82])
         }
         .frame(height: 200)
         .padding()
         .onAppear{ setupChart() }
       
    }
    
    func setupChart() {
        loadWeighInSeries()
        if includeAverage == true {
            calcAverages()
        }
    }
    
    func loadWeighInSeries() {
        let weighIns = [
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.5,
                    date: dateGet(year: 2024, month: 7, day: 8)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.9,
                    date: dateGet(year: 2024, month: 7, day: 9)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.6,
                    date: dateGet(year: 2024, month: 7, day: 10)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.2,
                    date: dateGet(year: 2024, month: 7, day: 11)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.0,
                    date: dateGet(year: 2024, month: 7, day: 12)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 80.1,
                    date: dateGet(year: 2024, month: 7, day: 13)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.8,
                    date: dateGet(year: 2024, month: 7, day: 14)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.7,
                    date: dateGet(year: 2024, month: 7, day: 15)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.5,
                    date: dateGet(year: 2024, month: 7, day: 16)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.8,
                    date: dateGet(year: 2024, month: 7, day: 17)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.3,
                    date: dateGet(year: 2024, month: 7, day: 18)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.5,
                    date: dateGet(year: 2024, month: 7, day: 19)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.2,
                    date: dateGet(year: 2024, month: 7, day: 20)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 79.3,
                    date: dateGet(year: 2024, month: 7, day: 21))
        ]
        
        weighInSeries.name = "Weigh Ins"
        weighInSeries.weighIns = weighIns
   //     weighInSeries.weighIns = appController.demoData.weighIns
        
        weighInSeries.weighIns = weighInSeries.weighIns.sorted()
        chartSeries.append(weighInSeries)
    }
    
    func calcAverages() {
        var averageWeighIns = [WeighIn]()
        for index in 1...weighInSeries.weighIns.count-1 {
            let totalWeight = weighInSeries.weighIns[index-1].weight + weighInSeries.weighIns[index].weight
            
            let averageWeight = totalWeight / 2
            let newAverageWeighIn = WeighIn(weekOfYear: weighInSeries.weighIns[index].weekOfYear,
                    dayOfWeek: weighInSeries.weighIns[index].dayOfWeek,
                    weight: averageWeight,
                    date: weighInSeries.weighIns[index].date)
            averageWeighIns.append(newAverageWeighIn)
        }
        averageSeries.name = "Average"
        averageSeries.weighIns = averageWeighIns
        chartSeries.append(averageSeries)
    }
}

/// A data series for the lines.
struct WeighInSeries: Identifiable {
    /// The name of the series displayed in the legend.
    var name: String = "default"

    /// WeighIn for each week.
    var weighIns: [WeighIn] = [WeighIn]()

    /// The identifier for the series.
    let id = UUID()
}


#Preview {
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}

