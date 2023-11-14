//
//  LessonCard.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 19/11/2023.
//

import SwiftUI

struct Lesson1Card: View {
   // var lesson: LessonJSN
    
    var body: some View {
        ZStack {
            Image("run-634702_1920")//.image
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 250, height: 140)
                .shadow(radius: 4)
                .opacity(0.3)
                .overlay {
                    RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 1)
                }
            
            Text("lesson.headline")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 245)
            
            HStack {
//                Text("00:00").foregroundColor(.black)
//                Spacer()
//
//                Spacer()
//                Image(systemName: "checkmark")
//                    .foregroundColor(.green)
//                    .font(.title2)
//                    .opacity(1)      //lesson.isCompleted ? 1 : 0)
//                }.frame(width: 220)
//                .offset(y: 50)
//            
//            Image(systemName: "star.fill")
//                .foregroundColor(.yellow)
//                .opacity(1)         //lesson.isFavorite ? 1 : 0)
//                .offset(y: 50)
//                .font(.title)
            
//         //   if lesson.isLocked {
//                Image(systemName: "lock.fill")
//                .foregroundColor(.red)
//                .font(.title)
//                .offset(y: -50)
            }
        }.padding()
    }
}

#Preview {
    Lesson1Card()
}
