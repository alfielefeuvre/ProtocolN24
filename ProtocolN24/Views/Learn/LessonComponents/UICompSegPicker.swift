//
//  UICompSegPicker.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI

struct UICompSegPicker: View {
   // @EnvironmentObject var appController: AppController
    var uiData: UIData
    
    @State private var selectedPickerOption = "Not Sure"
//    var pickerOptions: [String] = ["Not Sure", "Fat Loss", "Muscle Gain"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(uiData.uiText)
            Picker("", selection: $selectedPickerOption) {
                ForEach(uiData.uiSegPickerOptions, id: \.self) {
                    Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            HStack {
                Text("Setting: \(selectedPickerOption)")
                Spacer()
                Button("Confirm") { selectionConfirmed() }.padding(.trailing)
            }
        }.padding()
    }
    
    func selectionConfirmed() {
        
        print("Button pressed")
        here 
        
    }
}

#Preview {
    let uiData = UIData(uiText: "Select a setting",
                        uiText2: "xx",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0, 
                        uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"],
                        uiQuestion: "xx",
                        uiAnswer: "xx")
    return UICompSegPicker(uiData: uiData).environmentObject(AppController())
}
