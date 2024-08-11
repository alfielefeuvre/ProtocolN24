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
    let displayBWDots: Bool
    let displayBWAvg2d: Bool
    let displayBWAvg3d: Bool
    let displayCalories: Bool
    
    var body: some View {
        ZStack {
            Chart {
                ForEach(viewModel.dataToDisplay, id: \.date) {
                    if $0.weight > 30 {
                        if displayBWDots == true {
                            PointMark(
                                x: .value("Date", $0.date, unit: .day),
                                y: .value("Bodyweight", (($0.weight - viewModel.bodyweightOffset) / Double(viewModel.trailingAxisAdjust)))
                            )
                            .foregroundStyle(by: .value("Value", "Bodyweight"))
                        }
                        
                        if displayBWAvg2d == true {
                            // average body weight 2dma
                            LineMark(
                                x: .value("Date", $0.date, unit: .day),
                                y: .value("Bodyweight 2dMA", (($0.ma2d - viewModel.bodyweightOffset) / Double(viewModel.trailingAxisAdjust)))
                            )
                            .foregroundStyle(by: .value("Value", "BW Avg"))
                        }
                        
                        if displayBWAvg3d == true {
                            // average body weight 3dma
                            LineMark(
                                x: .value("Date", $0.date, unit: .day),
                                y: .value("Bodyweight 3dMA", (($0.ma3d - viewModel.bodyweightOffset) / Double(viewModel.trailingAxisAdjust)))
                            )
                            .foregroundStyle(by: .value("Value", "BW 3dAvg"))
                        }
                    }
                    if $0.calories > 1 {
                        if displayCalories == true {
                            //calories
                            LineMark(
                                x: .value("Date", $0.date, unit: .day),
                                y: .value("Calories", (($0.calories - Double(viewModel.calorieOffset)) / Double(viewModel.leadingAxisAdjust)))
                            )
                            .foregroundStyle(by: .value("Value", "Calories"))
                        }
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
                    AxisValueLabel("\((axis.index * viewModel.leadingAxisAdjust) + viewModel.calorieOffset)", centered: false)
                       // .foregroundStyle(displayCalories ? .white: .clear)
                        .foregroundStyle(displayCalories ? .white: .clear)
                    
                        
                    
                    
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
        
        let day1 = DayData(date: Date.getDate(year: 2024, month: 01, day: 01), weight: 100, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day2 = DayData(date: Date.getDate(year: 2024, month: 01, day: 02), weight: 100.2, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day3 =  DayData(date: Date.getDate(year: 2024, month: 01, day: 03), weight: 100, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day4 = DayData(date: Date.getDate(year: 2024, month: 01, day: 04), weight: 100.3, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day5 = DayData(date: Date.getDate(year: 2024, month: 01, day: 05), weight: 99.9, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day6 = DayData(date: Date.getDate(year: 2024, month: 01, day: 06), weight: 100.2, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day7 = DayData(date: Date.getDate(year: 2024, month: 01, day: 07), weight: 100.2, calories: 3000, proteins: 175, fats: 41, carbs: 176)
        let day8 = DayData(date: Date.getDate(year: 2024, month: 01, day: 08), weight: 99.8, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day9 =  DayData(date: Date.getDate(year: 2024, month: 01, day: 09), weight: 99.9, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day10 = DayData(date: Date.getDate(year: 2024, month: 01, day: 10), weight: 99.5, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day11 = DayData(date: Date.getDate(year: 2024, month: 01, day: 11), weight: 99.9, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day12 = DayData(date: Date.getDate(year: 2024, month: 01, day: 12), weight: 99.1, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day13 = DayData(date: Date.getDate(year: 2024, month: 01, day: 13), weight: 99.6, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day14 = DayData(date: Date.getDate(year: 2024, month: 01, day: 14), weight: 98.7, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day15 = DayData(date: Date.getDate(year: 2024, month: 01, day: 15), weight: 99.1, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day16 = DayData(date: Date.getDate(year: 2024, month: 01, day: 16), weight: 98.5, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day17 = DayData(date: Date.getDate(year: 2024, month: 01, day: 17), weight: 98.9, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day18 = DayData(date: Date.getDate(year: 2024, month: 01, day: 18), weight: 98.2, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let day19 =  DayData(date: Date.getDate(year: 2024, month: 01, day: 19), weight: 98.6, calories: 2500, proteins: 175, fats: 41, carbs: 176)
        let dataToDisplay = [day1, day2, day3, day4, day5, day6, day7, day8, day9, day10, day11, day12, day13, day14, day15, day16, day17, day18, day19 ]
        
        return DailyChart(dataToDisplay: dataToDisplay,
                displayBWDots: true,
                displayBWAvg2d: true,
                displayBWAvg3d: true,
                displayCalories: true)
        
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
