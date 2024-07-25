//
//  Last19CalChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 25/07/2024.
//

import Charts
import SwiftUI

struct Last19CalChart: View {
    
    let deviceWidth = UIScreen.main.bounds.width * 0.9
    
    var body: some View {
        ZStack {
            Chart {
                ForEach(last19CalData, id: \.date) {
//                    PointMark(
//                        x: .value("Date", $0.date, unit: .day),
//                        y: .value("Bodyweight", ($0.weight - 98))
//                    )
//                    .foregroundStyle(by: .value("Value", "Bodyweight"))
//                    
//                  
//                        LineMark(
//                            x: .value("Date", $0.date, unit: .day),
//                            y: .value("Bodyweight", ($0.weight2dma - 98))
//                        ) .foregroundStyle(by: .value("Value", "Average Bodyweight"))
//                 
//                   
                    
                    LineMark(
                        x: .value("Date", $0.date, unit: .day),
                        y: .value("Calories", (($0.calories - 1000) / 500))
                    )
                //    .foregroundStyle(by: .value("Value", "Calories"))
                    .foregroundStyle(.orange)
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
                AxisMarks(position: .leading, values: Array(stride(from: 0, through: 4, by: 1))){
                    axis in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel("\((axis.index * 500) + 1000)", centered: false)
        }
                

                AxisMarks(position: .trailing, values: Array(stride(from: 0, through: 4, by: 1))){
                    axis in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel("\((axis.index + 98))", centered: false)
                        .foregroundStyle(.clear)
            
             }
            }
            .frame(width: deviceWidth, height: 200)
            .padding()
        }
    }
}

#Preview {
    Last19CalChart()
}
