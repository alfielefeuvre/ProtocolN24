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
    
    let modelContainer: ModelContainer
        
        init() {
            do {
                modelContainer = try ModelContainer(for: UserConfig.self, DayData.self)
            } catch {
                fatalError("Could not initialise ModelContainer")
            }
        }
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(appController)
        .modelContainer(for: [UserConfig.self, DayData.self])
    }
}
