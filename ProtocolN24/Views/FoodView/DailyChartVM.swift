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
        var bodyweightOffset: Double = 777
        
        var dataToDisplay: [ChartData] = [
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 21), weight: 88.5, calories: 2009, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 22), weight: 88.8, calories: 1826, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 23), weight: 88.8, calories: 1921, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 24), weight: 88.2, calories: 1724, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 25), weight: 88.1, calories: 1713, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 26), weight: 87.8, calories: 1746, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 27), weight: 87.5, calories: 2003, ma2d: 0),
            ChartData(date: Date.getDate(year: 2024, month: 07, day: 28), weight: 87.3, calories: 1789, ma2d: 0)
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
            idLowestBodyweight()
            load2DayMovingAverage()
            load3DayMovingAverage()
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
        
        func idLowestBodyweight() {
            for index in 0...dataToDisplay.count-1 {
                if dataToDisplay[index].weight < bodyweightOffset {
                    bodyweightOffset = Double(Int(dataToDisplay[index].weight))
                }
            }
        }
        
        func load2DayMovingAverage() {
             for index in 0...dataToDisplay.count-1 {
                if index == 0 { dataToDisplay[0].ma2d = dataToDisplay[0].weight }
                 else { dataToDisplay[index].ma2d = (dataToDisplay[index-1].weight + dataToDisplay[index].weight) * 0.5 }
            }
        }
        
        func load3DayMovingAverage() {
             for index in 0...dataToDisplay.count-1 {
                if index == 0 { dataToDisplay[0].ma3d = dataToDisplay[0].weight }
                 else if index == 1 { dataToDisplay[index].ma3d = (dataToDisplay[index-1].weight + dataToDisplay[index].weight) / 2 }
                 else { dataToDisplay[index].ma3d = (dataToDisplay[index-2].weight + dataToDisplay[index-1].weight + dataToDisplay[index].weight) / 3 }
            }
        }
    }
}
