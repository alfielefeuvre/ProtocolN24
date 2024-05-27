//
//  ContentView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \WeighIn.weekOfYear) var weighIns: [WeighIn]
    @Query var userConfig: [UserConfig]
     
    var body: some View {
        TabView {
            WeighInsView()
                .tabItem{ Label("Progress", systemImage: "chart.line.uptrend.xyaxis") }

            LearnView(lessons: appController.lessons)
                .tabItem{ Label("Learn   ", systemImage: "book") }
        }
        .onAppear{
            appController.loadLessonsFromStorage()
            if userConfig.count == 0 { setupDefaultUserConfig()
            } else { appController.updateLessonsWithUserConfig(userConfig: userConfig[0]) }
        }
    }
    
    func setupDefaultUserConfig() {
        let userConfig = UserConfig(isLessonComplete: [ 010 : false ],
                                    isLessonLocked: [ 10: false ],
                                    cutOrBulk: "Not Sure",
                                    startBodyweightKG: 0, calories: 0, protein: 0, fat: 0, carbs: 0)
        modelContext.insert(userConfig)
        try? modelContext.save()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
