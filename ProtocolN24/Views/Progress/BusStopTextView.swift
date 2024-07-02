//
//  BusStopTextView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 02/07/2024.
//

import SwiftUI

struct BusStopTextView: View {
    var body: some View {
        HStack {
            VStack {
                Text(" Sep, 20")
                Text(" 2024")
            }
            Spacer()
            Text("Week 6").font(.largeTitle)
            Spacer()
            VStack {
                Text("Oct, 15 ")
                Text("2024 ")
            }
        }
    }
}

#Preview {
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
