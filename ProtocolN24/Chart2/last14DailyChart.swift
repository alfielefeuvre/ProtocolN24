//
//  last14DailyChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/07/2024.
//
import Charts
import SwiftUI

struct last14DailyChart: View {
    
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    
    var body: some View {
        ZStack {
            Chart {
                ForEach(last14DailyData, id: \.date) {
                    PointMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Bodyweight", $0.weight)
                    )
                    .foregroundStyle(by: .value("Value", "Bodyweight"))
                    
                    PointMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Calories", $0.calories)
                    )
                    .foregroundStyle(by: .value("Value", "Calories"))
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                    //        .foregroundStyle(.clear)
                }
            }
            
            .chartYAxis {
                AxisMarks(position: .leading, values: Array(stride(from: 0, through: 24, by: 1))){
                    axis in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel("\(axis.index)", centered: false)
                }
                

                AxisMarks(position: .trailing, values: Array(stride(from: 0, through: 24, by: 4))){
                    axis in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel("\(axis.index)", centered: false)
            //        AxisValueLabel("\(axis.index * 4)", centered: false)
             }
            }
            .frame(width: deviceWidth, height: 200)
            .padding()
        }
    }
}

#Preview {
    last14DailyChart()
}
