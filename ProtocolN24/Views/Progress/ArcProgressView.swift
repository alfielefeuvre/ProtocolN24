//
//  ArcProgressView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 02/07/2024.
//

import SwiftUI
import SwiftData

struct ArcProgressView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    var body: some View {
        ZStack {
            ArcProgressBGView()
            ArcPercentageView(percent: userConfig[0].lostWeightPercent)
            ArcTextView()
        }.offset(y: 30)
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

struct ArcPercentageView: View {
    let percent: Double
    
    @State private var progress = 0.5
    
    var body: some View {
        ZStack {
            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(GaugeProgressStyle())
                .frame(width: 200, height: 200)
                .contentShape(Rectangle())
                .rotationEffect(Angle(degrees: 242.5))
        }.onAppear{ setProgress() }
    }
    
    func setProgress() {
        progress = percent / 12
    }
}

struct ArcProgressBGView: View {
    let progress = 0.65
    
    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .rotationEffect(Angle(degrees: 242.5))
            .opacity(0.2)
    }
}

struct ArcTextView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
   
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Text("Target")
                    Text("6%")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }.foregroundColor(userConfig[0].lostWeightPercent > 6 ? .green : .orange)
                .offset(CGSize(width: 45, height: -5))
                
                Circle()
                    .frame(width: 25)
                    .foregroundColor(userConfig[0].lostWeightPercent > 6 ? .green : .orange)
            }.offset(CGSize(width: 90, height: -43))
            
            Text("\(String(format: "%.1f", userConfig[0].lostWeightPercent))%")
                .font(.custom("system", size: 55))
                .offset(CGSize(width: 0, height: -12))
        }
    }
}

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 12.0      //25

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}
