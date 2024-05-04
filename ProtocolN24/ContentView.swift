//
//  ContentView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            WeighInsView()
                .tabItem{ Label("Progress", systemImage: "chart.line.uptrend.xyaxis") }

            LearnView()
                .tabItem{ Label("Learn   ", systemImage: "book") }
        }
    }
}

#Preview {
    ContentView()
}
