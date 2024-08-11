//
//  ContentVM.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 29/07/2024.
//

import Foundation
import SwiftUI

extension DailyChart {
    @Observable
    class ViewModel {
        let deviceWidth = UIScreen.main.bounds.width * 0.9
        
        // Trailing Axis
        var bodyweightOffset: Double = 777
        var bodyweightMin: Double = 100_000
        var bodyweightMax: Double = 0
        var trailingAxisAdjust: Int = 1
        
        // leading axis
        var calorieOffset: Int = 0
        var leadingAxisAdjust: Int = 500
        var calorieMin: Double = 100_000
        var calorieMax: Double = 0
        
        var dataToDisplay: [ChartData] = [
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 21), weight: 88.5, calories: 2009),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 22), weight: 88.8, calories: 1826),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 23), weight: 88.8, calories: 1921),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 24), weight: 88.2, calories: 1724),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 25), weight: 88.1, calories: 1713),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 26), weight: 87.8, calories: 1746),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 27), weight: 87.5, calories: 2003),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 28), weight: 87.3, calories: 1789)
        ]
        
        struct ChartData: Comparable {
            var date: Date = Date()
            var weight: Double = 0
            var calories: Double = 0
            var ma2d: Double = 0
            var ma3d: Double = 0
            
            static func <(lhs: ChartData, rhs: ChartData) -> Bool {
                return lhs.date < rhs.date
            }
        }
        
        func setupChart(dataIn: [DayData]) {
            loadChartData(dataIn: dataIn)
            idChartBWStats()
            idChartCalStats()
        }
        
        func loadChartData(dataIn: [DayData]) {
            dataToDisplay = []
            for index in 0...dataIn.count-1 {
                let newData = ChartData(date: dataIn[index].date,
                                        weight: dataIn[index].weight,
                                        calories:   dataIn[index].calories)
                dataToDisplay.append(newData)
            }
            dataToDisplay = dataToDisplay.sorted()
        }
        
        func idChartBWStats() {
            for index in 0...dataToDisplay.count-1 {
                if dataToDisplay[index].weight > 30 {
                    // id lowest Bodyweight
                    if dataToDisplay[index].weight < bodyweightMin {
                        bodyweightMin = Double(Int(dataToDisplay[index].weight))
                    }
                    
                    // id highest Bodyweight
                    if dataToDisplay[index].weight > bodyweightMax {
                        bodyweightMax = Double(Int(dataToDisplay[index].weight))
                    }
                    
                    // load moving averages
                    if index == 0 {
                        dataToDisplay[0].ma2d = dataToDisplay[0].weight
                        dataToDisplay[0].ma3d = dataToDisplay[0].weight
                     }
                    else if index == 1 {
                        dataToDisplay[index].ma2d = (dataToDisplay[index-1].weight + dataToDisplay[index].weight) / 2
                        dataToDisplay[index].ma3d = (dataToDisplay[index-1].weight + dataToDisplay[index].weight) / 2
                    } else {
                        dataToDisplay[index].ma2d = (dataToDisplay[index-1].weight + dataToDisplay[index].weight) / 2
                        dataToDisplay[index].ma3d = (dataToDisplay[index-2].weight + dataToDisplay[index-1].weight + dataToDisplay[index].weight) / 3
                    }
                }
            }
            
            calcBWYAxis()
            
            // Offset Chart Y axis to lowest kg value
            bodyweightOffset = bodyweightMin
            
        }
        
        func calcBWYAxis() {
            if (bodyweightMax - bodyweightMin) > 4 { trailingAxisAdjust = 2 }
            if (bodyweightMax - bodyweightMin) > 8 { trailingAxisAdjust = 3 }
            if (bodyweightMax - bodyweightMin) > 16 { trailingAxisAdjust = 4 }
            if (bodyweightMax - bodyweightMin) > 32 { trailingAxisAdjust = 5 }
        }
        
        func idChartCalStats() {
            for index in 0...dataToDisplay.count-1 {
                if dataToDisplay[index].calories > 300 {
                    // id lowest Cal
                    if dataToDisplay[index].calories < calorieMin {
                        calorieMin = Double(Int(dataToDisplay[index].calories))
                    }
                    
                    // id highest Cal
                    if dataToDisplay[index].calories > calorieMax {
                        calorieMax = Double(Int(dataToDisplay[index].calories))
                    }
                }
           }
           calcCalAxis()
        }
        
        func calcCalAxis() {
            if calorieMax > 2000 { calorieOffset = 500 }
            if calorieMax > 2500 { calorieOffset = 1_000 }
            if calorieMax > 3000 { calorieOffset = 1_500 }
            if calorieMax > 3500 { calorieOffset = 2_000 }
            if calorieMax > 4000 { calorieOffset = 3_000 }
            
//            let rangeMax = calorieOffset + 2000
//            let range = (rangeMax - Int(calorieMin))
//            print("Range: \(range)")
//            if range > 2000 { leadingAxisAdjust = 1_000 }
//            if range > 4000 { leadingAxisAdjust = 2_000 }
//            calorieOffset -= 500
        }
    }
}
