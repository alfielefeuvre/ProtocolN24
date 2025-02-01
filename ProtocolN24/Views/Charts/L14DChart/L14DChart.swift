//
//  L14DChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 01/02/2025.
//
import Charts
import SwiftData
import SwiftUI

struct L14DChart: View {
    @State private var viewModel = ViewModel()

    var body: some View {
        VStack {
            Chart {
                ForEach(viewModel.dataToDisplay, id: \.date) {
                    PointMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Bodyweight", $0.weight)
                    )
                    .foregroundStyle(by: .value("Value", "Bodyweight"))
                    
                    
                    PointMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Weekly Average", $0.weeklyAvg)
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
            .frame(width: viewModel.deviceWidth)
            .padding()

            
            
            
            
        }.chartYScale(domain: viewModel.chartYAxisLower...viewModel.chartYAxisUpper)
    }
}

#Preview {
    L14DChart()
}



//.chartForegroundStyleScale([
//    "Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow
//])


//                    LineMark(
//                        x: .value("Date", $0.date, unit: .day),
//                        y: .value("Calories", $0.calories)
//                    )
//                    .foregroundStyle(by: .value("Value", "Calories"))
//
//                    
