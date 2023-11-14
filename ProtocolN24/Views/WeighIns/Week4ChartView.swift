//
//  4WeekChartView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 19/11/2023.
//

import Charts
import SwiftData
import SwiftUI

struct Week4ChartView: View {
    
    var body: some View {
        Section("4 Week Chart") {
            VStack {
                Chart {
                    ForEach(WeighInData.last28Days) { series in
                        if series.name == "Weigh Ins" {
                            ForEach(series.weighIns, id: \.weekOfYear) { element in
                                PointMark(
                                    x: .value("Day", element.weekOfYear),    //, unit: .day),
                                    y: .value("Sales", element.weight))
                            }
                            .foregroundStyle(by: .value("City", series.name))
                            .symbol(by: .value("City", series.name))
                        }
                        
                        if series.name == "Minimum" {
                            ForEach(series.weighIns, id: \.weekOfYear) { element in
                                LineMark(
                                    x: .value("Day", element.weekOfYear),    //, unit: .day),
                                    y: .value("Sales", element.weight))
                            }
                            .foregroundStyle(by: .value("City", series.name))
                            .symbol(by: .value("City", series.name))
                        }
                        
                        if series.name == "Maximum" {
                            ForEach(series.weighIns, id: \.weekOfYear) { element in
                                LineMark(
                                    x: .value("Day", element.weekOfYear),    //, unit: .day),
                                    y: .value("Sales", element.weight))
                            }
                            .foregroundStyle(by: .value("City", series.name))
                            .symbol(by: .value("City", series.name))
                        }

                        

                    }
                    

//                    .foregroundStyle(.purple)
//                    .symbolSize(symbolSize)
                }
                .chartXScale(domain: [42, 47])
                .chartYScale(domain: [84, 90])

                Text("Week [n]")
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
        
        return Week4ChartView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
