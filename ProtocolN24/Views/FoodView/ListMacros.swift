//
//  ListMacros.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/07/2024.
//
import SwiftData
import SwiftUI

struct ListMacros: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DayData.date) var dailyData: [DayData]
    
    var body: some View {
        Section("Data") {
            ForEach(dailyData, id: \.self) { dailyData in
                Text("Weight: \(dailyData.weight.formatted()), Cal: \(dailyData.calories.formatted()), p: \(dailyData.proteins.formatted()), f: \(dailyData.fats.formatted()), c: \(dailyData.carbs.formatted()),  \(dailyData.date.formatted())")
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            let singleDayData = dailyData[offset]
            modelContext.delete(singleDayData)
        }
        try? modelContext.save()
    }
}

#Preview {
    ListMacros()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
}
