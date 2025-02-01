//
//  WeighInsView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftData
import SwiftUI

struct TrackingView: View {
    
    @State var weekRef: Int = 0
    @State var weekRefPrevious: Int = 0
    var calendar = Calendar(identifier: .gregorian)
    
    var body: some View {
        NavigationView {
            List{
            //    FatLossView()
           //     FatStatsView()
                AddWeighInView()
            }
            .navigationTitle("Progress")
        }
        .onAppear{
            weekRef = calendar.component(.weekOfYear, from: Date.now)
            weekRefPrevious = weekRef - 1
            if weekRefPrevious < 1 { weekRefPrevious = 52}
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
