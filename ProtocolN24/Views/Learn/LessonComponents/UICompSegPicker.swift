//
//  UICompSegPicker.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI
import SwiftData

struct UICompSegPicker: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
  
    var uiData: UIData
    var lessonId: Int
    @State private var selectedPickerOption = "Error"
    
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
         .onAppear{ assignPickerSelection()}
    }
    
    func assignPickerSelection() {
        switch lessonId {
        case 10: selectedPickerOption = userConfig[0].cutOrBulk
        default: selectedPickerOption = "Not Sure"
            print("Error: UICompSegPicker: assignPickerSelection(): lessonId: \(lessonId)")
        }
    }
    
    // Segmented Picker Response
    func uiSegmentedPickerResponse() {
        switch lessonId {
        case 10: selectCutOrBulk(response: selectedPickerOption)
        default: print("Error: UICompSegPicker: uiSegmentedPickerResponse(): lessonId: \(lessonId)")
        }
    }
    
    func selectCutOrBulk(response: String) { // Lesson 1 - Bulk or Cut
        if response == "Not Sure" { userConfig[0].isLessonComplete[10] = false
        } else { userConfig[0].isLessonComplete[10] = true }
        
        userConfig[0].cutOrBulk = response
        try? modelContext.save()
        appController.updateLessonsWithUserConfig(userConfig: userConfig[0])
    }
}

#Preview {
    let uiData = UIData(uiText: "Select a setting",
                        uiText2: "Lesson 1",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0, 
                        uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])
    
    return UICompSegPicker(uiData: uiData, lessonId: 20)
                .environmentObject(AppController())
                .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
