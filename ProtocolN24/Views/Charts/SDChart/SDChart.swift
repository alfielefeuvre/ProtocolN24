//
//  SDChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 10/02/2025.
//

import SwiftUI
import SwiftData
import Charts

struct SDChart: View {
    @State private var viewModel = ViewModel()
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DayData.date) var dailyData: [DayData] 
    
    var body: some View {
        VStack {
            Chart {
                ForEach(dailyData, id: \.date) {
                    if $0.date >= viewModel.oldestDate {
                        PointMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Bodyweight", $0.weight)
                        )
                        .foregroundStyle(by: .value("Value", "Bodyweight"))
                    }
                }
                
                ForEach(viewModel.averageDataToDisplay, id: \.date) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Bodyweight", $0.weeklyAvg)
                        )
                        .foregroundStyle(by: .value("Value", "Weekly Average"))
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                }
            }
            .chartYScale(domain: viewModel.chartYAxisLower...viewModel.chartYAxisUpper)
            
            Text("Fat Loss: \(viewModel.fatLossKg, specifier: "%.2f")kg, \(viewModel.fatLossPercent, specifier: "%.2f")%").padding(.top)
            Text("calsUnderFeedPerDay: \(-viewModel.calsUnderFeedPerDay, specifier: "%.1f")kcal").padding(.top)
            Text("maintCal: \((-viewModel.calsUnderFeedPerDay + 1745), specifier: "%.0f")kcal").padding(.top)
      }
        .frame(width: viewModel.viewWidth)
        .onAppear{ if dailyData.count > 0 { viewModel.setupChart(dataIn: dailyData) } }
    }
    
    func dataUpdate() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
//            
//        }
    }
}

#Preview {
    SDChart()
}
