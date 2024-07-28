//
//  ProtocolN24App.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftData
import SwiftUI

@main
struct ProtocolN24App: App {
    @StateObject var appController = AppController()
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(appController)
        .modelContainer(for: [WeighWeek.self, UserConfig.self, DayData.self])
    }
}
