//
//  FatStatsView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 03/07/2024.
//

import SwiftUI
import SwiftData

struct FatStatsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    var body: some View {
        Section("Fat Stats") {
            VStack { 
                HStack {
                    StatItem(title: "Weight Loss (kg)", stat: userConfig[0].lostWeightText)
                    StatItem(title: "Weight Loss (%)", stat: userConfig[0].lostWeightPercentText)
                }
                HStack {
                    StatItem(title: "Forecast Weight Loss (kg)", stat: userConfig[0].forecastLostWeightText)
                    StatItem(title: "Forecast Weight Loss (%)", stat: userConfig[0].forecastLostWeightPercentText)
                }
            }
        }
    }
}


struct StatItem: View {
    let squareWidth = UIScreen.main.bounds.width * 0.95 / 2.5
    let title: String
    let stat: String
    
    var body: some View {
        ZStack {

            RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                .foregroundColor(.primary)
                .opacity(0.1)
                .frame(width: squareWidth, height: squareWidth)
            
            VStack {
                Text(title).padding(.top)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            VStack {
                Spacer()
                Text(stat).padding(.top)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
}


#Preview {
    do {
        let previewer = try Previewer()
        return FatStatsView()
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
