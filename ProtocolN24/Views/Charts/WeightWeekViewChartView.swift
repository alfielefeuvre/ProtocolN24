//
//  WeightWeekViewChartView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 15/11/2023.
//

import Charts
import SwiftData
import SwiftUI

struct WeightWeekViewChartView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var weighIns: [WeighIn]
    var week: Int
    @State private var sortedWeighIns = [WeighIn]()
    @State private var averageWeight: Double = 0
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.clear)
                .frame(width: 250, height: 200)
            
            VStack {
                
                
                Chart(sortedWeighIns, id: \.dayOfWeek) { weighIn in
                    PointMark(
                        x: .value("Date", weighIn.dayOfWeek),
                        y: .value("Weight", weighIn.weight)
                    )
                }              
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day)) { _ in
                        AxisTick()
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.weekday(.narrow), centered: true)
                    }
                }
                .chartYScale(domain: [80, 85])
                
                Button("Week: \(week)"){ filterSort() }
            }
        }.padding()
        .onAppear { filterSort() }
    }
    
    func filterSort() {
        let filteredWeighIns = weighIns.filter { weighIn in
            if weighIn.weekOfYear == week {
                return true
            } else { return false }
        }
        sortedWeighIns = filteredWeighIns.sorted()
        calcAverage()
    }
    
    func calcAverage() {
        var totalWeight: Double = 0
        for weighIn in sortedWeighIns {
            totalWeight += weighIn.weight
        }
        print("Total: \(totalWeight)")
        let avgWeight = totalWeight / Double(sortedWeighIns.count)
        print("Average: \(avgWeight)")
        averageWeight = avgWeight
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: WeighIn.self, configurations: config)
        
        return TrackingView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

