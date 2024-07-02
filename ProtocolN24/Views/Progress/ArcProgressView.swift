//
//  ArcProgressView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 02/07/2024.
//

import SwiftUI

struct ArcProgressView: View {
    let max: Int
    let current: Int
    
    var body: some View {
        ZStack {
            ArcProgressBGView()
            ArcTextView()
        }.offset(y: 30)
    }
}

#Preview {
    TrackingView()
     //   .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
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
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Text("Target")
                    Text("6%")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }.foregroundColor(.orange)
                    .offset(CGSize(width: 45, height: -5))
                
                Circle()
                    .frame(width: 25)
                    .foregroundColor(.orange)
            }.offset(CGSize(width: 92, height: -40))
            
            Text("4.9%")
                .font(.custom("system", size: 55))
                .offset(CGSize(width: 0, height: -12))
        }
    }
}
