//
//  Lesson2.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 19/11/2023.
//

import SwiftUI

struct Lesson2: View {
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
                
                
            }
            .padding()
            Spacer()
            
          
                Picker("Setting", selection: $selectedSetting) {
                    ForEach(settings, id: \.self) {
                        Text($0)
                    }
                
                    
                }
                .pickerStyle(.segmented)
                .padding()
           
                Text("Setting: \(selectedSetting)")
            
        }
    }
}

#Preview {
    Lesson2()
}
