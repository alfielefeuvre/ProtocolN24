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
            }.navigationTitle("Food & Drink")
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return FoodView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
