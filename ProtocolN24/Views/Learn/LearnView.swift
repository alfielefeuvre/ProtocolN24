//
//  LearnView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftUI

struct LearnView: View {
    @EnvironmentObject var appController: AppController
    var lessons: [Lesson]
    
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    
    var body: some View {
        NavigationView {
                List {
//                    NavigationLink { LessonView(lesson: Lesson000().lesson000)} label: {
//                            ZStack {
//                                Image("Gym")
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: deviceWidth, height: deviceWidth * 0.7)
//                                Text("Start Here!").foregroundColor(.white).font(.largeTitle)
//                            }
//                    }
                    
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
                        .frame(height: 175)
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
                        .frame(height: 175)
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
    
    return LearnView(lessons: lessons).environmentObject(AppController())
}
