//
//  FoodView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/06/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct FoodView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DayData.date) var dailyData: [DayData]
        
    var body: some View {
        NavigationView {
            List {
                AddMacros()
                DailyChart(dataToDisplay: dailyData)
                ListMacros()
                
                Last14Chart()
                Last28Chart()
            }.navigationTitle("Food & Drink")
        }
    }
}

#Preview {
    FoodView()
        .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
}
