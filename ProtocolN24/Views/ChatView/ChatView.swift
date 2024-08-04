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
                    Text("Chat View")
                }
            }.navigationTitle("Chat")
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return ChatView()
         //   .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
