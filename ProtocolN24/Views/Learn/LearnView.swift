//
//  LearnView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftData
import SwiftUI

struct LearnView: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    var lessons: [Lesson]
    
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    
    var body: some View {
        NavigationView {
                List {                    
                    Section("Demo - Theory") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(lessons) { lesson in
                                    if lesson.module == .week1 {
                                        NavigationLink { LessonView(lesson: lesson)} label: { LessonItem(lesson: lesson) }
                                    }
                                }
                            }
                        }
                        .frame(height: 235)
                    }
                    
                    Section("Demo - Practical") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(lessons) { lesson in
                                    if lesson.module == .week2 {
                                        NavigationLink { LessonView(lesson: lesson)} label: { LessonItem(lesson: lesson) }
                                    }
                                }
                            }
                        }
                        .frame(height: 235)
                    }
                    
                    Section("Week 3") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(lessons) { lesson in
                                    if lesson.module == .week3 {
                                        NavigationLink { LessonView(lesson: lesson)} label: { LessonItem(lesson: lesson) }
                                    }
                                }
                            }
                        }
                        .frame(height: 235)
                    }
                    Section("RESET DATA") {
                        Button("RESET DATA"){ resetData() }
                    }
                    
                    Section("Use Alfie Data") {
                        Button("Alfie Data"){
                            resetData()
                            alfieData()
                        }
                    }
            }.navigationTitle("Lessons")
        }
    }
    
    func resetData() {
        userConfig[0].resetData()
        saveData()
    }
    
    func alfieData()  {
        userConfig[0].isLessonComplete = [ 000: true, 010: true, 020 : true  ]
        userConfig[0].isLessonLocked = [ 010: false ]
        userConfig[0].cutOrBulk = "Fat Loss"
        userConfig[0].startWeightKGDouble = 87.3
        userConfig[0].recentAvgBodyweightKG = 82.3
        userConfig[0].weeksIn = 7
        saveData()
    }
    
    func saveData() {
        try? modelContext.save()
        appController.updateLessonsWithUserConfig(userConfig: userConfig[0])
    }
}

#Preview {
    let lesson010 = Lesson010().lesson010
    let lesson020 = Lesson020().lesson020
    let lesson030 = Lesson030().lesson030
    let lessons = [lesson010, lesson020, lesson030]
    
    return LearnView(lessons: lessons)
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
