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
    
    var body: some View {
        NavigationView {
            List {
//                ZStack {
//                    Image("run-634702_1920")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(height: 250)
//                        .clipped()
//                        .listRowInsets(EdgeInsets())
//                }
                
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
                    .frame(height: 175)
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
