//
//  FatLossView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 02/07/2024.
//
import SwiftData
import SwiftUI

struct FatLossView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    var body: some View {
        Section("Fat Loss View") {
            VStack {
                ArcProgressView()
                BusStopView(stops: 12, stopsPassed: userConfig[0].weeksIn)
                BusStopTextView(weekIn: userConfig[0].weeksIn, startDate:
                                    userConfig[0].startDate,
                                    endDate: userConfig[0].endDate)
            }
        }
    }
}

#Preview {
    TrackingView()
     //   .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
