//
//  LearnView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftUI

struct LearnView: View {
    
    let lesson1 = Lesson(id: 1,
                         headlineText: "What you will get out the programme",
                         subHeadline: "Focused on results",
                         tenTextStrings: ["One1", "xx2", "3", "xx4", "5", "xx6", "7", "xx8", "9", "10"],
                         tenQuestions: ["Q1. Question 1?", "Q2. Question 2?", "Q3. Question 3?", "Q4", "Q5", "xQ6", "xQ7", "xQ8", "xQ9", "xQ10"],
                         tenAnswers: ["One1", "xA2", "3", "xA4", "5", "xA6", "7", "xA8", "9", "10"],
                         module: .quickStart,
                         imageName: "run-634702_1920")
    
    var body: some View {
        NavigationView {
            List {
                Section("Quick Start") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            NavigationLink { LessonView(lesson: lesson1)} label: { Lesson1Card() }
                        }
                    }
                    .frame(height: 150)
                }
                
                Section("Week 1") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            NavigationLink { Lesson2() } label: { Lesson2Card() }
                           
                        }
                    }
                    .frame(height: 150)
                }
            }.navigationTitle("Lessons")
        }
    }
}

#Preview {
    LearnView()
}
