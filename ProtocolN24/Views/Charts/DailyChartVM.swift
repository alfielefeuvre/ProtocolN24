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
            calcCalAxis()
        }
        
        func loadChartData(dataIn: [DayData]) {
            dataToDisplay = []
            
            if dataIn.count > 0 {
                for index in 0...dataIn.count-1 {
                    let newData = ChartData(date: dataIn[index].date,
                                            weight: dataIn[index].weight,
                                            calories:   dataIn[index].calories)
                    dataToDisplay.append(newData)
                }
                dataToDisplay = dataToDisplay.sorted()
            }
        }
        
        func idChartBWStats() {
            if dataToDisplay.count > 0 {
                for index in 0...dataToDisplay.count-1 {
                    if dataToDisplay[index].weight > 30 {   // so 0 values don't give mis-leading data
                        // id lowest Bodyweight
                        if dataToDisplay[index].weight < bodyweightMin {
                            bodyweightMin = Double(Int(dataToDisplay[index].weight))
                        }
                        
                        // id highest Bodyweight
                        if dataToDisplay[index].weight > bodyweightMax {
                            bodyweightMax = Double(Int(dataToDisplay[index].weight))
                        }
                        
                        // load moving averages
                        if index == 0 {                         // no previous readings for average calc so use existing weight
                            dataToDisplay[0].ma2d = dataToDisplay[0].weight
                            dataToDisplay[0].ma3d = dataToDisplay[0].weight
                         } else if index == 1 {
                            if dataToDisplay[0].weight < 30 {     // initial reading is zero, [1] is not
                                dataToDisplay[1].ma2d = dataToDisplay[1].weight
                                dataToDisplay[1].ma3d = dataToDisplay[1].weight
                            } else {
                                dataToDisplay[1].ma2d = (dataToDisplay[0].weight + dataToDisplay[1].weight) / 2
                                dataToDisplay[1].ma3d = (dataToDisplay[0].weight + dataToDisplay[1].weight) / 2
                            }
                        } else {
                            // index is 2 or above
                            // ongoing algorithm
                            // this reading is not zero
                            if dataToDisplay[index-1].weight < 30 { // [day before] is zero
                                if dataToDisplay[index-2].weight < 30 {
                                    // [day before] and [2 days before] are both zero
                                    dataToDisplay[index].ma2d = dataToDisplay[index].weight
                                    dataToDisplay[index].ma3d = dataToDisplay[index].weight
                                } else {
                                    // [just day before] is zero
                                    dataToDisplay[index].ma2d = dataToDisplay[index].weight
                                    dataToDisplay[index].ma3d = (dataToDisplay[index].weight + dataToDisplay[index-2].weight) / 2
                                }
                            } else if dataToDisplay[index-2].weight < 30 {
                                // [just 2 days before] is zero
                                dataToDisplay[index].ma2d = (dataToDisplay[index].weight + dataToDisplay[index-1].weight) / 2
                                dataToDisplay[index].ma3d = (dataToDisplay[index].weight + dataToDisplay[index-1].weight) / 2
                                
                            } else {
                                // no zeros
                                dataToDisplay[index].ma2d = (dataToDisplay[index].weight + dataToDisplay[index-1].weight) / 2
                                dataToDisplay[index].ma3d = (dataToDisplay[index].weight + dataToDisplay[index-1].weight + dataToDisplay[index-2].weight) / 3
                            }
                        }
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
            if dataToDisplay.count > 0 {
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
            }
        }
        
        func calcCalAxis() {
            if calorieMax > 2000 { calorieOffset = 500 }
            if calorieMax > 2500 { calorieOffset = 1_000 }
            if calorieMax > 3000 { calorieOffset = 1_500 }
            if calorieMax > 3500 { calorieOffset = 2_000 }
            if calorieMax > 4000 { calorieOffset = 3_000 }
            
//            let rangeMax = calorieOffset + 2000
//            let range = (rangeMax - Int(calorieMin))
//            if range > 2000 { leadingAxisAdjust = 1_000 }
//            if range > 4000 { leadingAxisAdjust = 2_000 }
//            calorieOffset -= 500
        }
    }
}
