//
//  Lesson1.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 19/11/2023.
//

import SwiftUI

struct Lesson1: View {
    let devideWidth = UIScreen.main.bounds.width
    
    @State private var selectedSetting = "Fat Loss"
    let settings = ["Fat Loss", "Muscle Gain"]
        
    
    var body: some View {
        ScrollView {
       
            ZStack {
                Image("run-634702_1920")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .opacity(0.7)
                    
                VStack {
                    // Headline
                    Text("What you will get out the programme")
                        .font(.largeTitle)
                        .padding()
                    
                    // Sub-headline
                    Text("Focused on results")
                        .font(.title2)
                    
                    Spacer()
                }
            }.frame(width: devideWidth * 0.95, height: devideWidth * 0.95 * 0.6)

            VStack(alignment: .leading) {
                
                Divider()
                
                Text("""
                     At the end of 12-weeks focused nutrition/training, the average body will adapt and it will be different than it was during week 1.
                    
                    What changes do you want to see after 12 weeks training? Protocol12 has two settings: fat loss or muscle gain.
                    
                    Set-up for fat loss, work hard for 12-weeks and the average person will lose __kg of fat which is __% of their bodyweight.
                    
                    Set-up for muscle gain, work hard for 12-weeks and the average person will improve their strength by __% over the main 6 exercises.
                    
                    Time to pick a setting, some people will find this an easy choice, for the others, here are some things you should know:
                    
                    Most people that set-up for fat loss will also gain strength.
                    
                    If you are happy to put on some weight over the next 12 weeks, set-up for muscle gain, if not, set up for fat loss.
                    
                    Most people that set-up for muscle gain will not lose any fat.
                    
                    If in doubt, set-up for fat loss.
                    
                    """)
                
                VStack {
                    Picker("Setting", selection: $selectedSetting) {
                        ForEach(settings, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    HStack {
                        Text("Setting:  \(selectedSetting)")
                            .padding()
                        Spacer()
                    }
                    
                    Button("Press Me") { buttonPressed() }
                         .buttonStyle(ButtonStandard())
                    
                }.padding()
            }.padding()
        }
    }
    
    func buttonPressed() {
        print("Pressed")
    }
}

#Preview {
    Lesson1()
}
