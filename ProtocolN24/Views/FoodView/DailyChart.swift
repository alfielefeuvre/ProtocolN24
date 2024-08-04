//
//  DailyChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/07/2024.
//
import Charts
import SwiftData
import SwiftUI

struct DailyChart: View {
    
    @State private var viewModel = ViewModel()
    let dataToDisplay: [DayData]
    
    var body: some View {
        ZStack {
            Chart {
                ForEach(viewModel.dataToDisplay, id: \.date) {
                    if $0.weight > 1 {
                        PointMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Bodyweight", (($0.weight - viewModel.bodyweightOffset) / Double(viewModel.trailingAxisAdjust)))
                        )
                        .foregroundStyle(by: .value("Value", "Bodyweight"))
                        
                        // average body weight 2dma
                        LineMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Bodyweight 2dMA", (($0.ma2d - viewModel.bodyweightOffset) / Double(viewModel.trailingAxisAdjust)))
                        )
                        .foregroundStyle(by: .value("Value", "BW Avg"))
                        
                        // average body weight 3dma
                        LineMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Bodyweight 3dMA", (($0.ma3d - viewModel.bodyweightOffset) / Double(viewModel.trailingAxisAdjust)))
                        )
                        .foregroundStyle(by: .value("Value", "BW 3dAvg"))
                    }
                    if $0.calories > 1 {
                        //calories
                        LineMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Calories", (($0.calories - Double(viewModel.calorieOffset)) / Double(viewModel.leadingAxisAdjust)))
                        )
                        .foregroundStyle(by: .value("Value", "Calories"))
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
            .chartYAxis {
                AxisMarks(position: .leading, values: Array(stride(from: 0, through: 4, by: 1))){
                    axis in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel("\((axis.index * viewModel.leadingAxisAdjust) + viewModel.calorieOffset)", centered: false) //viewModel.leadingAxisAdjust
                }
               
                AxisMarks(position: .trailing, values: Array(stride(from: 0, through: 4, by: 1))){
                    axis in
                    AxisTick()
                    AxisGridLine()
                    AxisValueLabel("\((axis.index  * viewModel.trailingAxisAdjust + Int(viewModel.bodyweightOffset)))", centered: false)
             }
            }
            .frame(width: viewModel.deviceWidth, height: 200)
            .padding()
        }
        .onAppear{ viewModel.setupChart(dataIn: dataToDisplay) }
    }
}


#Preview {
    do {
        let previewer = try Previewer()
        
                let day1 = DayData(date: Date.getDate(year: 2024, month: 07, day: 21), weight: 78.5, calories: 2009, proteins: 183, fats: 43, carbs: 223)
                let day2 = DayData(date: Date.getDate(year: 2024, month: 07, day: 22), weight: 78.8, calories: 1826, proteins: 158, fats: 58, carbs: 167)
                let day3 = DayData(date: Date.getDate(year: 2024, month: 07, day: 23), weight: 78.8, calories: 1921, proteins: 153, fats: 74, carbs: 147)
                let day4 = DayData(date: Date.getDate(year: 2024, month: 07, day: 24), weight: 78.2, calories: 1724, proteins: 178, fats: 43, carbs: 157)
                let day5 = DayData(date: Date.getDate(year: 2024, month: 07, day: 25), weight: 78.1, calories: 1713, proteins: 179, fats: 41, carbs: 158)
                let day6 = DayData(date: Date.getDate(year: 2024, month: 07, day: 26), weight: 77.8, calories: 1746, proteins: 177, fats: 40, carbs: 169)
                let day7 = DayData(date: Date.getDate(year: 2024, month: 07, day: 27), weight: 77.8, calories: 2003, proteins: 176, fats: 75, carbs: 156)
                let day8 = DayData(date: Date.getDate(year: 2024, month: 07, day: 28), weight: 77.3, calories: 1800, proteins: 177, fats: 40, carbs: 181)
                let dataToDisplay = [day1, day2, day3, day4, day5, day6, day7, day8 ]
        
        return DailyChart(dataToDisplay: dataToDisplay)
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
