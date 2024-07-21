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
    
    @State private var selection = 3
    @State private var hasPaid = false
     
    var body: some View {
        TabView(selection:$selection) {
            FoodView()
                .tabItem{ Label("Food & Drink", systemImage: "fork.knife") } .tag(1)
            
            TrackingView()
                .tabItem{ Label("Progress", systemImage: "chart.line.uptrend.xyaxis") } .tag(2)

            LearnView(lessons: appController.lessons)
                .tabItem{ Label("Learn", systemImage: "book") } .tag(3)
            
            if hasPaid == true {
                ChatView()
                    .tabItem{ Label("Chat", systemImage: "bubble.left") } .tag(4)
                
                WorkoutView()
                    .tabItem{ Label("Workout", systemImage: "dumbbell") } .tag(5)
            }
        }
        .onAppear{
            appController.loadLessonsFromStorage()
            if userConfig.count == 0 { setupDefaultUserConfig()
            } else { appController.updateLessonsWithUserConfig(userConfig: userConfig[0]) }
            
            
            for i in stride(from: 0, through: 24, by: 4) {
                print(i)
            }
            
            print("here")
            
        }
        .navigationViewStyle(.stack)
    }
    
    func setupDefaultUserConfig() {
        let userConfig = UserConfig(isLessonComplete: [ 010 : false ],
                                    isLessonLocked: [ 10: false ],
                                    cutOrBulk: "Not Sure", 
                                    startWeightKGDouble: 0,
                                    recentAvgBodyweightKG: 0,
                                    calories: 0, protein: 0, fat: 0, carbs: 0)
        
        modelContext.insert(userConfig)
        try? modelContext.save()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
