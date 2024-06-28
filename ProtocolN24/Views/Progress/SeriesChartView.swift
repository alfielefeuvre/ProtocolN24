//
//  SeriesChartView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 17/11/2023.
//

import Charts
import SwiftData
import SwiftUI

struct SeriesChartView: View {
    
    var weekRef: Int 
    
    var body: some View {
        Section("Series Chart") {
            VStack {
                Chart {
                    ForEach(WeighInData.last7Days) { series in
                        ForEach(series.weighIns, id: \.date) { element in
                            PointMark(
                                x: .value("Day", element.date, unit: .day),
                                y: .value("Sales", element.weight)
                            )
                            
                        }
                        .foregroundStyle(by: .value("City", series.name))
                        .symbol(by: .value("City", series.name))
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
              
                Text("Week \(weekRef)")
            }
            .frame(height: 200)
            .padding()
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: WeighIn.self, configurations: config)
        
        return WeighInsView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
