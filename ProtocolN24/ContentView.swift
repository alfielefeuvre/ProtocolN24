//
//  ContentView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appController: AppController

    var body: some View {
        TabView {
            WeighInsView()
                .tabItem{ Label("Progress", systemImage: "chart.line.uptrend.xyaxis") }

            LearnView(lessons: appController.lessons)
                .tabItem{ Label("Learn   ", systemImage: "book") }
        }
        .onAppear{
            appController.setup()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppController())
        .modelContainer(for: WeighWeek.self)
}
