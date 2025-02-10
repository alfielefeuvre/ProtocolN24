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
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                }
            }
            .chartYScale(domain: 72...74)
            
            Text("Fat Loss: 4.0kg, 2.4)%").padding(.top)
        }
        .frame(width: viewModel.viewWidth)
    }
    
    func dataUpdate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            
        }
    }
}

#Preview {
    SDChart()
}
