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
        VStack(alignment: .leading) {
            lesson.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .padding(.top)
            Text(lesson.shortName)
                .foregroundStyle(.primary)
                .font(.caption)
                .padding(.bottom)
        }
        .padding()
    }
}

#Preview {
    let lesson = Lesson010().lesson010
    return LessonItem(lesson: lesson)
}
