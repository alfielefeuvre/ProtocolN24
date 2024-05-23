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
    @State private var viewModel = ViewModel()

    var body: some View {
        ScrollView {
            ForEach(lesson.uiComponents) { uiComponent in
                Divider()
                switch uiComponent.type {
                case .uiHeader: UICompHeader(uiData: uiComponent.uiData,
                                           deviceWidth: viewModel.deviceWidth)
                case .uiImageName: UICompImage(uiData: uiComponent.uiData,
                                                   deviceWidth: viewModel.deviceWidth)
                case .uiSegPicker: UICompSegPicker(uiData: uiComponent.uiData)
                case .uiTextString: UICompText(uiData: uiComponent.uiData)
                }
            }
        }
        .onAppear{ viewModel.clearAnswers() }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Image(systemName: "checkmark.circle.fill").padding()
                    .opacity(appController.lessonComplete ? 1 : 0)
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
        }
    }
}

extension LessonView {
    @Observable
    class ViewModel {
        
        let deviceWidth = UIScreen.main.bounds.width * 0.95
        
        var answer1Displayed = false
        var answer2Displayed = false
        var answer3Displayed = false
        var answer4Displayed = false
        var answer5Displayed = false
        var answer6Displayed = false
        var answer7Displayed = false
        var answer8Displayed = false
        var answer9Displayed = false
        var answer10Displayed = false
        var answer11Displayed = false
        
        var answersDisplayed: [Bool] {
            [   answer1Displayed,
                answer2Displayed,
                answer3Displayed,
                answer4Displayed,
                answer5Displayed,
                answer6Displayed,
                answer7Displayed,
                answer8Displayed,
                answer9Displayed,
                answer10Displayed,
                answer11Displayed ]
        }
        
        func toggleAnswer(index: Int) {
            switch index {
            case 0: answer1Displayed.toggle()
            case 1: answer2Displayed.toggle()
            case 2: answer3Displayed.toggle()
            case 3: answer4Displayed.toggle()
            case 4: answer5Displayed.toggle()
            case 5: answer6Displayed.toggle()
            case 6: answer7Displayed.toggle()
            case 7: answer8Displayed.toggle()
            case 8: answer9Displayed.toggle()
            case 9: answer10Displayed.toggle()
            case 10: answer11Displayed.toggle()
            default: print("ERROR: LessonView, ViewModel: toggleAnswer(index: \(index)")
            }
        }
        
        func clearAnswers() {
            answer1Displayed = false
            answer2Displayed = false
            answer3Displayed = false
            answer4Displayed = false
            answer5Displayed = false
            answer6Displayed = false
            answer7Displayed = false
            answer8Displayed = false
            answer9Displayed = false
            answer10Displayed = false
            answer11Displayed = false
        }
    }

}


#Preview {
 
    let lesson010 = Lesson010().lesson010
    let lesson020 = Lesson020().lesson020
    let lesson030 = Lesson030().lesson030
    let lessons = [lesson010, lesson020, lesson030]
    
    return LearnView(lessons: lessons).environmentObject(AppController())
    
    //LessonView(lesson: AppController().demoLesson).environmentObject(AppController())
}


//            ForEach((0...9), id: \.self) {
//                if lesson.tenTextStrings[$0].prefix(2) != "xx" {
//                    Text(lesson.tenTextStrings[$0])
//                }
//
//                // images
//                if lesson.tenImageStrings[$0].prefix(2) != "xx" {
//                    Image(lesson.tenImageStrings[$0])
//                        .resizable()
//                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
//                        .opacity(0.7)
//                        .frame(width: viewModel.deviceWidth, height: viewModel.deviceWidth * 0.6)
//                }
//
//                // selectors
//
//
//
//


// Q&A
//            ForEach((0...9), id: \.self) { index in
//                if lesson.tenQuestions[index].prefix(2) != "xx" {
//                    ZStack(alignment: .leading) {
//                        RoundedRectangle(cornerRadius: 12.0)
//                            .frame(width: viewModel.deviceWidth)
//                            .foregroundColor(.gray)
//                            .opacity(0.5)
//                            .onTapGesture { withAnimation {
//                                viewModel.toggleAnswer(index: index)
//                            }
//                        }
//                        HStack {
//                            VStack {
//                                Text(lesson.tenQuestions[index]).padding()
//                                if viewModel.answersDisplayed[index] {
//                                    Text(lesson.tenAnswers[index]).padding()
//                                }
//                            }
//                            Spacer()
//                            VStack {
//                                Image(systemName: "chevron.down").padding()
//                                    .rotationEffect(viewModel.answersDisplayed[index] ? .degrees(0) : .degrees(180))
//                                Spacer()
//                            }
//
//                        }
//                    }.padding()
//                }
//            }
