//
//  LessonItem.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import SwiftUI

struct LessonItem: View {
    var lesson: Lesson
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                ZStack {
                    lesson.image
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                        .padding(.top)
                    
                    VStack {
                        HStack {
                            ZStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.white)
                                    .opacity(lesson.isLocked ? 1 : 0)
                                    .padding(.leading)
                            }
                            
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.white)
                                .opacity(lesson.isComplete ? 1 : 0)
                        }
                        Spacer()
                    }.frame(width: 155, height: 125)
                    .padding(.trailing)
                }

                Text(lesson.headline)
                    .foregroundStyle(.primary)
                    .frame(width: 155)
                    .font(.caption)
                
                Text(lesson.dayRef)
                    .foregroundStyle(.primary)
                    .padding(.bottom)
            }.frame(width: 155, height: 255)
                .padding()
        }.opacity(lesson.isComplete ? 0.5 : 1)
    }
}

#Preview {
    let lesson = Lesson(id: 046, headline: "Headliner, multi line that goes over 2 lines ", dayRef: "Day 1 (1/3)", module: .week1, isComplete: true, isLocked: true, imageName: "Gym", uiComponents: [])
    return LessonItem(lesson: lesson)
}
