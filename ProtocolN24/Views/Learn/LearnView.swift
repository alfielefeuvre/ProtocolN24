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
                    Section("14d Chart") {
                        L14DChart()
                            .frame(height: 200)
                            .padding()
                    }
                    Section("10 Secrets to Shredded") {
                        ScrollView(.horizontal, showsIndicators: false) {
                         //   HStack(alignment: .top, spacing: 0) {
                                ForEach(lessons) { lesson in
                                    if lesson.module == .quickStart {
                                        NavigationLink { LessonView(lesson: lesson)} label: { LessonItem(lesson: lesson) }
                                    }
                                }
                         //   }
                        }
                        .frame(height: 535)
                    }
                    
                  //  CountdownView()
                    
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
    do {
        let previewer = try Previewer()
        let lesson000 = Lesson000().lesson000
        let lesson010 = Lesson010().lesson010
        let lesson020 = Lesson020().lesson020
        let lesson030 = Lesson030().lesson030
        let lesson040 = Lesson040().lesson040
        let lesson050 = Lesson050().lesson050
        let lesson060 = Lesson060().lesson060
        let lesson070 = Lesson070().lesson070
        let lesson080 = Lesson080().lesson080
        let lesson090 = Lesson090().lesson090
        let lesson100 = Lesson100().lesson100
        let lesson110 = Lesson110().lesson110
        let lesson120 = Lesson120().lesson120
        let lessons = [lesson000, lesson010, lesson020, lesson030,
                       lesson040, lesson050, lesson060,
                       lesson070, lesson080, lesson090,
                       lesson100, lesson110, lesson120]
        
        return LearnView(lessons: lessons)
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
