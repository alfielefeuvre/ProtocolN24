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
                case .uiDDChart: UICompDDChart(uiData: uiComponent.uiData)
          }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Image(systemName: "checkmark.circle.fill").padding()
                    .opacity(lesson.isComplete ? 1 : 0)
            }
        }
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
