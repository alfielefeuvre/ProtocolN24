//
//  UICompSegPicker.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI

struct UICompSegPicker: View {
    @EnvironmentObject var appController: AppController
    var uiData: UIData
    
    @State private var selectedPickerOption = "Not Sure"
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(uiData.uiText).padding(.leading)
            Picker("", selection: $selectedPickerOption) {
                ForEach(uiData.uiSegPickerOptions, id: \.self) {
                    Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            HStack {
                Text("Setting: \(selectedPickerOption)").padding(.leading)
                Spacer()
                Button("Confirm") { uiSegmentedPickerResponse() }.padding(.trailing)
            }
               
        }.padding()
    }
    
    // Segmented Picker Response
    func uiSegmentedPickerResponse() {
        print("selectedPickerOption: \(selectedPickerOption)")
        switch uiData.uiText2 {
        case "Lesson 1": appController.selectCutOrBulk(response: selectedPickerOption)
        default: print("Error: UICompSegPicker: uiSegmentedPickerResponse(): lessonRef: \(uiData.uiText2)")
        }
    }
}

#Preview {
    let uiData = UIData(uiText: "Select a setting",
                        uiText2: "Lesson 1",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0, 
                        uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"],
                        uiQuestion: "xx",
                        uiAnswer: "xx")
    return UICompSegPicker(uiData: uiData).environmentObject(AppController())
}
