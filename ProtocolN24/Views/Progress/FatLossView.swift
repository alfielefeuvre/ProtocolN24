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
                BusStopView(stops: 8, stopsPassed: userConfig[0].weeksIn)
                BusStopTextView(weekIn: userConfig[0].weeksIn, startDate:
                                    userConfig[0].startDate,
                                    endDate: userConfig[0].endDate)
            }
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return TrackingView()
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
