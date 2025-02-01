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
        var chartYAxisUpper: Double = 100
        var chartYAxisLower: Double = 70
       
        var dataToDisplay: [ChartData] = [
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
        
        struct ChartData: Comparable {
            var date: Date = Date()
            var weight: Double = 0
            var calories: Double = 0
            var weeklyAvg: Double = 0
            var ma3d: Double = 0
            
            static func <(lhs: ChartData, rhs: ChartData) -> Bool {
                return lhs.date < rhs.date
            }
        }
        
    }
}
