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
            VStack(alignment: .leading) {
                lesson.image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155)
                    .cornerRadius(5)
                    .padding(.top)
                Text(lesson.dayRef)
                    .foregroundStyle(.primary)
                    .font(.caption)
                    .padding(.bottom)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .opacity(lesson.isComplete ? 1 : 0)
                   
                }.padding(.trailing)
                Spacer()
            }.frame(width: 155, height: 155)
                .padding()
        }.opacity(lesson.isComplete ? 0.5 : 1)
    }
}

#Preview {
    let lesson = Lesson010().lesson010
    return LessonItem(lesson: lesson)
}
