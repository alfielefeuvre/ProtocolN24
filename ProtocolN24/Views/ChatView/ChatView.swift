//
//  ChatView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 13/07/2024.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Chat") {
                    last14DailyChart()
                }
            }
        }
    }
}

#Preview {
    ChatView()
}
