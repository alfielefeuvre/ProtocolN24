//
//  LessonView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/05/2024.
//

import SwiftUI

struct LessonView: View {
    var lesson: Lesson

    let devideWidth = UIScreen.main.bounds.width * 0.95
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(lesson.imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .opacity(0.7)
                
                VStack {
                    Text(lesson.headlineText)
                        .font(.largeTitle)
                        .padding()
                    
                   Text(lesson.subHeadline)
                        .font(.title2)
                    
                    Spacer()
                }
            }.frame(width: devideWidth , height: devideWidth * 0.6)
            
            
            ForEach((0...9), id: \.self) {
                if lesson.tenTextStrings[$0] != "x" {
                    Text(lesson.tenTextStrings[$0])
                }
                
            }
            
            
            
            
            
            
            
        }
    }
}

#Preview {
    LessonView(lesson: Lesson(id: 1,
                              headlineText: "What you will get out the programme",
                              subHeadline: "Focused on results", 
                              tenTextStrings: ["One1", "x", "3", "x", "5", "x", "7", "x", "9", "10"],
                              module: .quickStart,
                              imageName: "run-634702_1920"))
}
