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
                        .frame(width: 255, height: 155)
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
                    }.frame(width: 255, height: 125)
                        .padding(.trailing)
                    
                }
                Text(lesson.headline)
                    .foregroundStyle(.primary)
                    .frame(width: 255)
                    .multilineTextAlignment(.center)
                 
                Text(lesson.dayRef)
                    .foregroundStyle(.primary)
               //     .padding(.bottom)
                
            }.frame(width: 255, height: 255)
                .padding()
        }.opacity(lesson.isComplete ? 0.5 : 1)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
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
        let lessons = [lesson010, lesson020, lesson030,
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

