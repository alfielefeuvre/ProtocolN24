//
//  Data.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 17/11/2023.
//

import Foundation
//import GameplayKit

func dateGet(year: Int, month: Int, day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

struct WeighInData {
    /// A data series for the lines.
    struct Series: Identifiable {
        /// The name of the series displed in teh legend.
        let name: String

        /// WeighIn for each week.
        let weighIns: [WeighIn]

        /// The identifier for the series.
        let id = UUID()
    }

    /// Sales by location and weekday for the last 30 days.
    static let last7Days: [Series] = [
        .init(name: "Weigh Ins", weighIns: [
            WeighIn(weekOfYear: 46, dayOfWeek: 1, weight: 85.1,
                    date: dateGet(year: 2023, month: 11, day: 13)),
            WeighIn(weekOfYear: 46, dayOfWeek: 2, weight: 86.1,
                    date: dateGet(year: 2023, month: 11, day: 14)),
            WeighIn(weekOfYear: 46, dayOfWeek: 6, weight: 88.1,
                    date: dateGet(year: 2023, month: 11, day: 18)),
            WeighIn(weekOfYear: 46, dayOfWeek: 7, weight: 89.1,
                    date: dateGet(year: 2023, month: 11, day: 19))
        ]),

        .init(name: "Average", weighIns: [
            WeighIn(weekOfYear: 46, dayOfWeek: 4, weight: 87.1,
                    date: dateGet(year: 2023, month: 11, day: 16))
        ])
    ]
    
    /// Sales by location and weekday for the last 30 days.
    static let last28Days: [Series] = [
        .init(name: "Weigh Ins", weighIns: [
            WeighIn(weekOfYear: 46, dayOfWeek: 1, weight: 85.1,
                    date: dateGet(year: 2023, month: 11, day: 13)),
            WeighIn(weekOfYear: 45, dayOfWeek: 2, weight: 86.1,
                    date: dateGet(year: 2023, month: 11, day: 14)),
            WeighIn(weekOfYear: 44, dayOfWeek: 6, weight: 88.1,
                    date: dateGet(year: 2023, month: 11, day: 18)),
            WeighIn(weekOfYear: 43, dayOfWeek: 7, weight: 89.1,
                    date: dateGet(year: 2023, month: 11, day: 19))
        ]),

        .init(name: "Minimum", weighIns: [
            WeighIn(weekOfYear: 43, dayOfWeek: 7, weight: 88.9,
                    date: dateGet(year: 2023, month: 11, day: 19)),
            
            WeighIn(weekOfYear: 46, dayOfWeek: 4, weight: 84.1,
                    date: dateGet(year: 2023, month: 11, day: 13))
        ]),
        
        .init(name: "Maximum", weighIns: [
            WeighIn(weekOfYear: 43, dayOfWeek: 7, weight: 89.2,
                    date: dateGet(year: 2023, month: 11, day: 19)),
            
            WeighIn(weekOfYear: 46, dayOfWeek: 4, weight: 86.1,
                    date: dateGet(year: 2023, month: 11, day: 13))
        ])
    ]
    
    
    
    
    
    
}
