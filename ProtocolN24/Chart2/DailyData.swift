//
//  DailyData.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/07/2024.
//

import Foundation

struct DailyDataStruct {
    var date: Date
    var calories: Double
    var weight: Double
}

let last14DailyData: [DailyDataStruct] = [
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 01), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 02), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 03), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 04), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 05), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 06), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 07), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 08), calories: 3000, weight: 100),
//    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 09), calories: 3000, weight: 100),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 10), calories: 20, weight: 12),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 11), calories: 19, weight: 24),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 12), calories: 18, weight: 10)
]
