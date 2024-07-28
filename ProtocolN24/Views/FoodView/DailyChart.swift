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
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DayData.date) var dailyData: [DayData]
    
    let deviceWidth = UIScreen.main.bounds.width * 0.9
    
    var body: some View {
        ZStack {
            Chart {
                ForEach(dailyData, id: \.date) {
                    if $0.weight > 1 {
                        PointMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Bodyweight", $0.weight)
                        )
                        .foregroundStyle(by: .value("Value", "Bodyweight"))
                        
                        LineMark(
                            x: .value("Date", $0.date, unit: .day),
                            y: .value("Calories", (($0.calories - 1000) / 500))
                        )
                        .foregroundStyle(by: .value("Value", "Calories"))
                    }
                }
            }
            .frame(width: deviceWidth, height: 200)
            .padding()
        }
        .onAppear{ setUpChart() }
    }
    
    func setUpChart() {
        
    }
}

#Preview {
    DailyChart()
        .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
}
