//
//  WeighCalChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 11/07/2024.
//
import Charts
import SwiftData
import SwiftUI

struct WeighCalChart: View {
    @Environment(\.modelContext) private var modelContext
    @Query var weighIns: [WeighIn]
    
    @State private var caloriesPerDay = [Int]()
    
    let includeAverage: Bool
    let includeAveragePoint: Bool
    @State private var weighInSeries = WeighInSeries()
    @State private var averageSeries = WeighInSeries()
    @State private var averagePointSeries = WeighInSeries()
    @State private var chartSeries = [WeighInSeries]()
    @State private var yScaleUpper: Int = 82
    @State private var yScaleLower: Int = 78
    
    var calendar = Calendar(identifier: .gregorian)
    
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
                        ).opacity(series.name == "Weigh Ins" ? 0 : 1)
                    }
                    .foregroundStyle(by: .value("Series", series.name))
            //        .symbol(by: .value("City", series.name))
                }
            }.foregroundStyle(.clear)
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
       //             AxisTick()
            //        AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                        .foregroundStyle(.clear)
                }
          
            }
            .chartYAxis {
                AxisMarks(position: .leading)
             //   AxisMarks(position: .trailing)
            }
            
            
            
            
            
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
                        ).opacity(series.name == "Weigh Ins" ? 0 : 1)
                    }
                    .foregroundStyle(by: .value("Series", series.name))
            //        .symbol(by: .value("City", series.name))
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
       //             AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                }
          
            }
            .chartYScale(domain: [98, 101])
        }
        .frame(height: 200)
        .padding()
        .onAppear{ setupChart() }
   }
   
   func setupChart() {
       loadWeighInSeries()
       if includeAverage == true { calcAverages() }
       if includeAveragePoint == true { calcAveragePoint() }
   }
   
   func loadWeighInSeries() {
       let weighIns = [
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.5,
                   date: dateGet(year: 2024, month: 7, day: 8)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 100.4,
                   date: dateGet(year: 2024, month: 7, day: 9)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.8,
                   date: dateGet(year: 2024, month: 7, day: 10)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.9,
                   date: dateGet(year: 2024, month: 7, day: 11)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.5,
                   date: dateGet(year: 2024, month: 7, day: 12)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.9,
                   date: dateGet(year: 2024, month: 7, day: 13)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.1,
                   
                   date: dateGet(year: 2024, month: 7, day: 14)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.6,
                   date: dateGet(year: 2024, month: 7, day: 15)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 98.7,
                   date: dateGet(year: 2024, month: 7, day: 16)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 99.1,
                   date: dateGet(year: 2024, month: 7, day: 17)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 98.5,
                   date: dateGet(year: 2024, month: 7, day: 18)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 98.9,
                   date: dateGet(year: 2024, month: 7, day: 19)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 98.2,
                   date: dateGet(year: 2024, month: 7, day: 20)),
           WeighIn(weekOfYear: 9, dayOfWeek: 2, weight: 98.6,
                   date: dateGet(year: 2024, month: 7, day: 21))
       ]
       
       weighInSeries.name = "Weigh Ins"
       weighInSeries.weighIns = weighIns
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
   
   func calcAveragePoint() {
       var averagePoints = [WeighIn]()
       var runningTotalWeight: Double = 0
       var numberOfPoints: Double = 0
       var averagePoint1: Double = 0
       var averagePoint2: Double = 0
       
       for index in 0...weighInSeries.weighIns.count-1 {
           numberOfPoints += 1
           runningTotalWeight += weighInSeries.weighIns[index].weight
           if numberOfPoints <= 7 {
               averagePoint1 = runningTotalWeight / numberOfPoints
           } else {
               averagePoint2 = runningTotalWeight / (numberOfPoints - 7)
           }
           
           if numberOfPoints == 7 {
               let newAveragePoint =  WeighIn(weekOfYear: weighInSeries.weighIns[index-3].weekOfYear,
                                              dayOfWeek: weighInSeries.weighIns[index-3].dayOfWeek,
                                              weight: averagePoint1,
                                              date: weighInSeries.weighIns[index-3].date)
               averagePoints.append(newAveragePoint)
               runningTotalWeight = 0
           } else if numberOfPoints == 14 {
               let newAveragePoint =  WeighIn(weekOfYear: weighInSeries.weighIns[index-3].weekOfYear,
                                              dayOfWeek: weighInSeries.weighIns[index-3].dayOfWeek,
                                              weight: averagePoint2,
                                              date: weighInSeries.weighIns[index-3].date)
               averagePoints.append(newAveragePoint)
           }
       }
       averagePointSeries.name = "Average Point"
       averagePointSeries.weighIns = averagePoints
       chartSeries.append(averagePointSeries)
   }
}

#Preview {
    WeighCalChart(includeAverage: false, includeAveragePoint: false)
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
