//
//  LessonView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/05/2024.
//

import SwiftUI

struct LessonView: View {
    var lesson: Lesson
    
    @State private var viewModel = ViewModel()

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
            }.frame(width: viewModel.deviceWidth , height: viewModel.deviceWidth * 0.6)
            
            
            ForEach((0...9), id: \.self) {
                if lesson.tenTextStrings[$0].prefix(2) != "xx" {
                    Text(lesson.tenTextStrings[$0])
                }
                
                // images
                
                // selectors?
            }
            
            Divider()
            
            // Q&A
            ForEach((0...9), id: \.self) { index in
                if lesson.tenQuestions[index].prefix(2) != "xx" {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12.0)
                            .frame(width: viewModel.deviceWidth)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                            .onTapGesture { withAnimation {
                                viewModel.toggleAnswer(index: index)
                            }
                        }
                        HStack {
                            VStack {
                                Text(lesson.tenQuestions[index]).padding()
                                if viewModel.answersDisplayed[index] {
                                    Text(lesson.tenAnswers[index]).padding()
                                }
                            }
                            Spacer()
                            VStack {
                                Image(systemName: "chevron.down").padding()
                                    .rotationEffect(viewModel.answersDisplayed[index] ? .degrees(0) : .degrees(180))
                                Spacer()
                            }
                            
                        }
                    }.padding()
                }
            }
        }
        .onAppear{
            viewModel.clearAnswers()
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
    LessonView(lesson: Lesson(id: 1,
                              headlineText: "What you will get out the programme",
                              subHeadline: "Focused on results",
                              tenTextStrings: ["One1", "xx2", "3", "xx4", "5", "xx6", "7", "xx8", "9", "10"],
                              tenQuestions: ["Q1. Question 1?", "Q2. Question 2?", "Q3. Question 3?", "Q4", "Q5", "xQ6", "xQ7", "xQ8", "xQ9", "xQ10"],
                              tenAnswers: ["One1", "xA2", "3", "xA4", "5", "xA6", "7", "xA8", "9", "10"],
                              module: .quickStart,
                              imageName: "run-634702_1920"))
}
