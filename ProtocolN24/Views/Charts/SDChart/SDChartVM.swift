//
//  SDChartVM.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 10/02/2025.
//

import Charts
import Foundation
import SwiftUI

extension SDChart {
    @Observable
    class ViewModel {
        let oldestDate = Date() - (14 *  86401) // last 14 days
        let viewWidth = UIScreen.main.bounds.width * 0.85
        var chartYAxisUpper: Double = 74
        var chartYAxisLower: Double = 72
        var fatLossKg: Double = 0
        var fatLossPercent: Double = 0
        var calsUnderFeedPerDay: Double = 0
        
        var averageDataToDisplay: [ChartData] = [ ]
        
        struct ChartData: Comparable {
            var date: Date = Date()
            var weeklyAvg: Double = 0
            
            static func <(lhs: ChartData, rhs: ChartData) -> Bool {
                return lhs.date < rhs.date
            }
        }
        
        func setupChart(dataIn: [DayData]) {
            loadChartData(dataIn: dataIn)
        }
        
        func trimDataToLast14Days(fullDataIn: [DayData]) -> [ChartData] {
            var chartDataToReturn: [ChartData] = []
            for dayData in fullDataIn {
                if dayData.date >= oldestDate {
                    let newChartData = ChartData(date: dayData.date, weeklyAvg: dayData.weight)
                    chartDataToReturn.append(newChartData)
                }
            }
            return chartDataToReturn
        }
        
        func loadChartData(dataIn: [DayData]) {
            averageDataToDisplay = []
            
            let last14DaysData = trimDataToLast14Days(fullDataIn: dataIn)
            
            var thisWeekTotal = 0.0
            var thisWeekCount = 0
            
            var lastWeekTotal = 0.0
            var lastWeekCount = 0
            
            for index in 0...last14DaysData.count-1 {
                if last14DaysData[index].date > oldestDate + (7 *  86401) { // this week
                    thisWeekTotal += last14DaysData[index].weeklyAvg
                    thisWeekCount += 1
                } else {                                                       // last week
                    lastWeekTotal += last14DaysData[index].weeklyAvg
                    lastWeekCount += 1
                }
            }
            let thisWeekAvg = thisWeekTotal / Double(thisWeekCount)
            let lastWeekAvg = lastWeekTotal / Double(lastWeekCount)
            
            fatLossKg = thisWeekAvg - lastWeekAvg
            fatLossPercent = (fatLossKg / lastWeekAvg) * 100
            
            let newData1 = ChartData(date: oldestDate + (11 *  86401), weeklyAvg: thisWeekAvg)
            let newData2 = ChartData(date: oldestDate + (4 *  86401), weeklyAvg: lastWeekAvg)
            
            averageDataToDisplay.append(newData1)
            averageDataToDisplay.append(newData2)
            // 7,700 kcals to kg of FAT
            
            calsUnderFeedPerDay = fatLossKg * 7700 / 7
            
        }
    }
}

