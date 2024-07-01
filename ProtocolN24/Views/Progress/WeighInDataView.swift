//
//  WeighInDataView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/11/2023.
//

import SwiftData
import SwiftUI

struct WeighInDataView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WeighIn.dayOfWeek) var weighIns: [WeighIn]
    
    var body: some View {
        Section("Weekly Weigh-ins: \(weighIns.count)") {
            ForEach(weighIns) { weighIn in
               Text("weigt: \(weighIn.weight)")
            }
            .onDelete(perform: deleteWeighIn)
        }
    }
    
    func deleteWeighIn(at indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(weighIns[index])
        }
        try? modelContext.save()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: WeighIn.self, configurations: config)
        
//        let wI1 = WeighIn(weekRef: calendar.component(.weekOfYear, from: .now),
//                          weight: 85.1, date: .now)
//        let wI2 = WeighIn(weekRef: calendar.component(.weekOfYear, from: .now),
//                          weight: 85.0, date: .now)
//        let wI3 = WeighIn(weekRef: calendar.component(.weekOfYear, from: .now),
//                          weight: 86.4, date: .now)
//        let wI4 = WeighIn(weekRef: calendar.component(.weekOfYear, from: .now),
//                          weight: 84.9, date: .now)
//        let wI5 = WeighIn(weekRef: calendar.component(.weekOfYear, from: .now),
//                          weight: 85.3, date: .now)
//        
//        let weighIns = [wI1, wI2]
        
        return TrackingView()
           .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

