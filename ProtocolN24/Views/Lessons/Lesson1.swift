//
//  Lesson1.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 19/11/2023.
//

import SwiftUI

struct Lesson1: View {
    var body: some View {
        ScrollView {
       
            Rectangle()
                .foregroundColor(.gray)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 200)
            
            CircleImage(image: Image("run-634702_1920"))
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text("The 'Protocol 12' Philosophy")
                    .font(.title)

                Divider()

                Text("Origin Story")
                    .font(.title2)
                    .padding()
                
                Text("Protocol 12 started life as a rebellion against all that is wrong with the fitness industry. This is an anti-influencer experiment, its a results driven process to help people reach their fitness goals. It is just a 12-week protocol which delivers time and time again. \n")
                
                Text("Since its inception Protocol 12 has helped over [  ] people reach their fitness goals. The average fat loss is [] kG/Lbs, the average muscle gained is [] kg/lbs and the average performance has improved by []%. \n")
                
                Text("Consistency is King")
                    .font(.title2)
                    .padding()
                
                Text("The best way to delivery lasting results is to  ")
                
                
                
                
                
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    Lesson1()
}
