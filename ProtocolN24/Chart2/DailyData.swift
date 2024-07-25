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
    var weight2dma: Double
}

let last14DailyData: [DailyDataStruct] = [
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 01), calories: 3000, weight: 99.8, weight2dma: 99.9),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 02), calories: 3000, weight: 100.2, weight2dma: 100),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 03), calories: 3000, weight: 100, weight2dma: 100.1),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 04), calories: 3000, weight: 100.3, weight2dma: 100.15),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 05), calories: 3000, weight: 99.9, weight2dma: 100.1),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 06), calories: 3000, weight: 100.2, weight2dma: 100.05),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 07), calories: 3000, weight: 100.2, weight2dma: 100.2),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 08), calories: 2500, weight: 99.8, weight2dma: 100),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 09), calories: 2500, weight: 99.9, weight2dma: 99.85),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 10), calories: 2500, weight: 99.5, weight2dma: 99.7),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 11), calories: 2500, weight: 99.9, weight2dma: 99.7),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 12), calories: 2500, weight: 99.1, weight2dma: 99.5),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 13), calories: 2500, weight: 99.6, weight2dma: 99.35),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 14), calories: 2500, weight: 98.7, weight2dma: 99.15),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 15), calories: 2500, weight: 99.1, weight2dma: 98.9),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 16), calories: 2500, weight: 98.5, weight2dma: 98.8),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 17), calories: 2500, weight: 98.9, weight2dma: 98.7),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 18), calories: 2500, weight: 98.2, weight2dma: 98.55),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 19), calories: 2500, weight: 98.6, weight2dma: 98.4)
]

let last19CalData: [DailyDataStruct] = [
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 01), calories: 3000, weight: 99.8, weight2dma: 99.9),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 02), calories: 3000, weight: 100.2, weight2dma: 100),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 03), calories: 3000, weight: 100, weight2dma: 100.1),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 04), calories: 3000, weight: 100.3, weight2dma: 100.15),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 05), calories: 3000, weight: 99.9, weight2dma: 100.1),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 06), calories: 3000, weight: 100.2, weight2dma: 100.05),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 07), calories: 3000, weight: 100.2, weight2dma: 100.2),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 08), calories: 2500, weight: 99.8, weight2dma: 100),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 09), calories: 2500, weight: 99.9, weight2dma: 99.85),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 10), calories: 2500, weight: 99.5, weight2dma: 99.7),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 11), calories: 2500, weight: 99.9, weight2dma: 99.7),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 12), calories: 2500, weight: 99.1, weight2dma: 99.5),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 13), calories: 2500, weight: 99.6, weight2dma: 99.35),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 14), calories: 2500, weight: 98.7, weight2dma: 99.15),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 15), calories: 2500, weight: 99.1, weight2dma: 98.9),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 16), calories: 2500, weight: 98.5, weight2dma: 98.8),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 17), calories: 2500, weight: 98.9, weight2dma: 98.7),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 18), calories: 2500, weight: 98.2, weight2dma: 98.55),
    DailyDataStruct(date: Date.getDate(year: 2024, month: 01, day: 19), calories: 2500, weight: 98.6, weight2dma: 98.4)
]
