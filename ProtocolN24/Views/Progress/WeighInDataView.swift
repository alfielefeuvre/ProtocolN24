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
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}

