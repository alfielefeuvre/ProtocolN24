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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: WeighWeek.self)
    }
}
