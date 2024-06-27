//
//  LessonView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/05/2024.
//

import SwiftUI

struct LessonView: View {
    @EnvironmentObject var appController: AppController

    var lesson: Lesson

    var body: some View {
        ScrollView {
            ForEach(lesson.uiComponents) { uiComponent in
                switch uiComponent.type {
                case .uiEnd: UICompEnd(uiData: uiComponent.uiData, lessonId: lesson.id)
                case .uiHeader: UICompHeader(uiData: uiComponent.uiData)
                case .uiImageName: UICompImage(uiData: uiComponent.uiData)
                case .uiQandA: UICompQuestion(uiData: uiComponent.uiData)
                case .uiSegPicker: UICompSegPicker(uiData: uiComponent.uiData,
                                                   lessonId: lesson.id)
                case .uiStepper: UICompStepper(lessonId: lesson.id)
                case .uiTextString: UICompText(uiData: uiComponent.uiData, lessonId: lesson.id)
                }
            }
        }
      //  .onAppear{ viewModel.clearAnswers() }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Image(systemName: "checkmark.circle.fill").padding()
                    .opacity(lesson.isComplete ? 1 : 0)
            }
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

//            ToolbarItemGroup(placement: .secondaryAction) {
//                Button("Settings") {
//                    print("Credits tapped")
//                }
//
//                Button("Email Me") {
//                    print("Email tapped")
//                }
//            }
