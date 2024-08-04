//
//  WorkoutView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/06/2024.
//

import SwiftUI

struct WorkoutView: View {
    
    var body: some View {
        NavigationView {
            List {
                Text("Workout View")
            }.navigationTitle("Workouts")
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return WorkoutView()
         //   .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
