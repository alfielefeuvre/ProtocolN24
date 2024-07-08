//
//  DemoData.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 08/07/2024.
//
import Charts
import Foundation
import SwiftUI


struct DemoData {
    
    /// A data series for the lines.
    struct Series: Identifiable {
        /// The name of the series displayed in the legend.
        let name: String

        /// WeighIn for each week.
        let weighIns: [WeighIn]

        /// The identifier for the series.
        let id = UUID()
    }

    /// Sales by location and weekday for the last 30 days.
    static let last7Days: [Series] = [
        .init(name: "Weigh Ins", weighIns: [
            WeighIn(weekOfYear: 28, dayOfWeek: 1, weight: 85.1,
                    date: dateGet(year: 2024, month: 7, day: 8)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 86.1,
                    date: dateGet(year: 2024, month: 7, day: 9)),
            WeighIn(weekOfYear: 28, dayOfWeek: 6, weight: 0,
                    date: dateGet(year: 2024, month: 7, day: 12)),
            WeighIn(weekOfYear: 28, dayOfWeek: 7, weight: 89.1,
                    date: dateGet(year: 2024, month: 7, day: 8))
        ]),

        .init(name: "Average", weighIns: [
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 87.1,
                    date: dateGet(year: 2024, month: 7, day: 8)),
            
            WeighIn(weekOfYear: 28, dayOfWeek: 4, weight: 86.1,
                    date: dateGet(year: 2024, month: 7, day: 9)),
            
            WeighIn(weekOfYear: 28, dayOfWeek: 6, weight: 85.1,
                    date: dateGet(year: 2024, month: 7, day: 21))
        ])
    ]
    
    static let last10Days: [Series] = [
        .init(name: "Weigh Ins", weighIns: [
            WeighIn(weekOfYear: 28, dayOfWeek: 1, weight: 85.1,
                    date: dateGet(year: 2024, month: 7, day: 8)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 86.1,
                    date: dateGet(year: 2024, month: 7, day: 9)),
            WeighIn(weekOfYear: 28, dayOfWeek: 6, weight: 0,
                    date: dateGet(year: 2024, month: 7, day: 12)),
            WeighIn(weekOfYear: 28, dayOfWeek: 7, weight: 89.1,
                    date: dateGet(year: 2024, month: 7, day: 8))
        ]),

        .init(name: "Average", weighIns: [
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 87.1,
                    date: dateGet(year: 2024, month: 7, day: 8)),

            WeighIn(weekOfYear: 28, dayOfWeek: 4, weight: 86.1,
                    date: dateGet(year: 2024, month: 7, day: 9)),
            
            WeighIn(weekOfYear: 28, dayOfWeek: 6, weight: 85.1,
                    date: dateGet(year: 2024, month: 7, day: 10))
        ])
    ]

}


#Preview {
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
