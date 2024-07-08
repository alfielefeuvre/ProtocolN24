//
//  Demo4Data.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 08/07/2024.
//

import Foundation

class Demo4Data: NSObject, ObservableObject {
    
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
    
}
