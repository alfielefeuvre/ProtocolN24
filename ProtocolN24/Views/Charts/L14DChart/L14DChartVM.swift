//
//  Untitled.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 01/02/2025.
//

import Charts
import Foundation
import SwiftUI

extension L14DChart {
    @Observable
    class ViewModel {
        let deviceWidth = UIScreen.main.bounds.width * 0.85
        var chartYAxisUpper: Double = 30
        var chartYAxisLower: Double = 0
        var fatLossKg: Double = 0
        var fatLossPercent: Double = 0
        
        var dataToDisplay: [ChartData] = [ ]
        
        struct ChartData: Comparable {
            var date: Date = Date()
            var weight: Double = 0
            var calories: Double = 0
            var weeklyAvg: Double = 0
            
            static func <(lhs: ChartData, rhs: ChartData) -> Bool {
                return lhs.date < rhs.date
            }
        }
        
        func setupChart(dataIn: [DayData]) {
            loadChartData(dataIn: dataIn)
            calcLast14AvgBodyWeight()
            calcYAxisLimits()
            
            
//            idChartBWStats()
//            idChartCalStats()
//            calcCalAxis()
            
//            setupChartWithDemoData()
        }
        
        func loadChartData(dataIn: [DayData]) {
            dataToDisplay = []
            let today = Date()
            let last14Days = Array(dataIn.sorted().reversed())
            
            for index in 0...13 {
                
                // default values
                var dayWeight = 0.0
                var dayCalories = 0.0
                
                // Calc each date for the last 14 days
                let secondsSinceToday: Double = Double(index * 86400)
                let indexedDate = (today - secondsSinceToday)
                
                // check if there is recorded data for this day
                let indexedShortDate = Date.getShortDate(date: indexedDate)
                
                for index in 0...last14Days.count-1 {
                    let last14DayShortDate = Date.getShortDate(date: last14Days[index].date)
                    
                    if indexedShortDate == last14DayShortDate {  //record exists
                         dayWeight = last14Days[index].weight
                        dayCalories = last14Days[index].calories
                    }
                }
                let newData = ChartData(date: indexedDate, weight: dayWeight, calories: dayCalories )
                dataToDisplay.append(newData)
            }
        }
        
        func calcLast14AvgBodyWeight() {
            var thisWeekTotal = 0.0
            var thisWeekCount = 0
            
            var lastWeekTotal = 0.0
            var lastWeekCount = 0
            
            for index in 0...dataToDisplay.count-1 {
                if index < 7 {  // this week
                    if (dataToDisplay[index].weight + dataToDisplay[index].calories) > 0 {
                        thisWeekTotal += dataToDisplay[index].weight
                        thisWeekCount += 1
                    }
                } else {        // last week
                    if (dataToDisplay[index].weight + dataToDisplay[index].calories) > 0 {
                        lastWeekTotal += dataToDisplay[index].weight
                        lastWeekCount += 1
                    }
                }
            }
            dataToDisplay[3].weeklyAvg = thisWeekTotal / Double(thisWeekCount)
            dataToDisplay[10].weeklyAvg = lastWeekTotal / Double(lastWeekCount)
            fatLossKg = dataToDisplay[10].weeklyAvg - dataToDisplay[3].weeklyAvg
            fatLossPercent = (fatLossKg / dataToDisplay[3].weeklyAvg) * 100
        }
        
        func calcYAxisLimits() {
            var bodyweightMin: Double = 100_000
            var bodyweightMax: Double = 0
            
            for index in 0...dataToDisplay.count-1 {
                
                // id lowest Bodyweight
                if dataToDisplay[index].weight < bodyweightMin {
                    if dataToDisplay[index].weight > 1 {
                        bodyweightMin = Double(Int(dataToDisplay[index].weight))
                    }
                }
                
                // id highest Bodyweight
                if dataToDisplay[index].weight > bodyweightMax {
                    bodyweightMax = Double(Int(dataToDisplay[index].weight))
                }
            }
            chartYAxisUpper = bodyweightMax + 1
            chartYAxisLower = bodyweightMin 
        }
        
        func setupChartWithDemoData() {
            dataToDisplay = [
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 15), weight: 88.5, calories: 2009),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 16), weight: 88.8, calories: 1826),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 17), weight: 88.8, calories: 1921),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 18), weight: 88.2, calories: 1724, weeklyAvg: 78),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 19), weight: 88.1, calories: 1713),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 20), weight: 87.8, calories: 1746),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 21), weight: 88.5, calories: 2009),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 22), weight: 88.8, calories: 1826),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 23), weight: 88.8, calories: 1921),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 24), weight: 88.2, calories: 1724),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 25), weight: 88.1, calories: 1713, weeklyAvg: 77),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 26), weight: 87.8, calories: 1746),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 27), weight: 87.5, calories: 2003),
                ChartData(date: Date.getDate(year: 2024, month: 07, day: 28), weight: 87.3, calories: 1789)
            ]
        }
    }
}



//DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) { [self] in
//    print("dataDisplay.count: \(dataToDisplay.count)")
//}
