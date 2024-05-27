//
//  UICompQuestion.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 26/05/2024.
//

import SwiftUI

struct UICompQuestion: View {
    var uiData: UIData
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    
    @State private var answerDisplayed: Bool = false
    
    var body: some View {
       
        if uiData.uiText.prefix(2) != "xx" {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12.0)
                    .frame(width: deviceWidth)
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .onTapGesture { withAnimation {
                        answerDisplayed.toggle()
                    }
                }
                HStack {
                    VStack {
                        Text(uiData.uiText).padding()
                        if answerDisplayed {
                            Text(uiData.uiText2).padding()
                        }
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "chevron.down").padding()
                            .rotationEffect(answerDisplayed ? .degrees(180) : .degrees(0))
                        Spacer()
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    let uiData = UIData(uiText: "Question 1",
                        uiText2: "Answer 1",
                        uiImage: "Gym",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 1,
                        uiSegPickerOptions: ["xx"])
    return UICompQuestion(uiData: uiData)
}
