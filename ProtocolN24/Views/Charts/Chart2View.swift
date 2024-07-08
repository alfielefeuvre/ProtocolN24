//
//  ChartView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 08/07/2024.
//

import Charts
import Foundation
import SwiftUI
import SwiftData

struct Chart2View: View {
    
    @State private var sortedWeighIns = [WeighIn]()
    
    @State private var weight6Data = [WeighIn]()
    
//        WeighIn(weekOfYear: 28, dayOfWeek: 1, weight: 85.1,
//                date: dateGet(year: 2024, month: 7, day: 8)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 86.1,
//                date: dateGet(year: 2024, month: 7, day: 9)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 6, weight: 0,
//                date: dateGet(year: 2024, month: 7, day: 12)),
//        WeighIn(weekOfYear: 28, dayOfWeek: 7, weight: 89.1,
//                date: dateGet(year: 2024, month: 7, day: 8))
//    ]
    
    var body: some View {
        Section("Demo Data Chart") {
            VStack {
                Chart {
                    ForEach(DemoData.last7Days) { series in
                        ForEach(series.weighIns, id: \.date) { element in
                            PointMark(
                                x: .value("Day", element.date, unit: .day),
                                y: .value("Sales", element.weight)
                            )
                            
                            LineMark(
                                x: .value("Day", element.date, unit: .day),
                                y: .value("Sales", element.weight)
                            ).opacity(series.name == "Average" ? 1 : 0)
                            
                        }
                        .foregroundStyle(by: .value("City", series.name))
    //                    .symbol(by: .value("City", series.name))
                    }
                }
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day)) { _ in
                        AxisTick()
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                    }
                }
                .chartYScale(domain: [84, 90])
            }
            .frame(height: 200)
            .padding()
            .onAppear{ loadData()
                
            }
        }
    }
    
    func loadData() {
        weight6Data = [
            WeighIn(weekOfYear: 28, dayOfWeek: 1, weight: 85.1,
                    date: dateGet(year: 2024, month: 7, day: 8)),
            WeighIn(weekOfYear: 28, dayOfWeek: 2, weight: 86.1,
                    date: dateGet(year: 2024, month: 7, day: 9)),
            WeighIn(weekOfYear: 28, dayOfWeek: 6, weight: 0,
                    date: dateGet(year: 2024, month: 7, day: 12)),
            WeighIn(weekOfYear: 28, dayOfWeek: 7, weight: 89.1,
                    date: dateGet(year: 2024, month: 7, day: 8))
        ]
        
        
//        let dater = DemoData.last7Days()
//        let sourceDater = dater.last7Days
    //    sourceData = DemoData.last7Days
    }
}


#Preview {
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
