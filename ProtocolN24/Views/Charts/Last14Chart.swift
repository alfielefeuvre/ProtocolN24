//
//  Last14Chart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 10/07/2024.
//
import Charts
import SwiftData
import SwiftUI

struct Last14Chart: View {
    @Environment(\.modelContext) private var modelContext
    @Query var weighIns: [WeighIn]
    
    var calendar = Calendar(identifier: .gregorian)
    
    @State private var last14WeighIns = [WeighIn]()
    @State private var last14Series = WeighInSeries()
    @State private var chartSeries = [WeighInSeries]()
    @State private var yScaleUpper: Int = 82
    @State private var yScaleLower: Int = 78
    
    var body: some View {
        ZStack {
            Chart {
                ForEach(chartSeries) { series in
                    ForEach(series.weighIns, id: \.date) { element in
                        PointMark(
                            x: .value("Day", element.date, unit: .day),
                            y: .value("Sales", element.weight)
                        ).opacity(series.name == "Average" ? 0 : 1)
                        LineMark(
                            x: .value("Day", element.date, unit: .day),
                            y: .value("Sales", element.weight)
                        ).opacity(series.name == "Weigh Ins" ? 0 : 1)
                    }
                    .foregroundStyle(by: .value("Series", series.name))
                    //        .symbol(by: .value("City", series.name))
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                }
            }
            .chartXScale(domain: [Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
                                  Calendar.current.date(byAdding: .day, value: 1, to: Date())!])
            .chartYScale(domain: [yScaleLower, yScaleUpper])
        }
        .frame(height: 200)
        .padding()
        .onAppear{ setupChart() }
    }
    
    func setupChart() {
        if chartSeries.count == 0 {
            filterLast14()
        }
    }
    
    func filterLast14() {
        let filteredWeighIns = weighIns.filter { weighIn in
            if weighIn.date > Calendar.current.date(byAdding: .day, value: -15, to: Date())! {
                return true
            } else { return false }
        }
        last14WeighIns = filteredWeighIns.sorted()
        last14Series.name = "Last14"
        last14Series.weighIns = filteredWeighIns
        chartSeries.append(last14Series)
    }
}

#Preview {
    Last14Chart()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
