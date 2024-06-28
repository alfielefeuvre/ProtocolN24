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
                    Section("Week 1") {
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
                    
                    Section("Week 2") {
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
                    Button("RESET DATA"){
                        userConfig[0].isLessonComplete = [ 010: false ]
                        userConfig[0].isLessonLocked = [ 010: false ]
                        userConfig[0].cutOrBulk = "Not Sure"
                        userConfig[0].startBodyweightKG = 0
                        userConfig[0].calories = 0
                        userConfig[0].carbs = 0
                        userConfig[0].protein = 0
                        userConfig[0].fat = 0
                        
                        try? modelContext.save()
                        appController.updateLessonsWithUserConfig(userConfig: userConfig[0])
                    }
            }.navigationTitle("Lessons")
        }
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
