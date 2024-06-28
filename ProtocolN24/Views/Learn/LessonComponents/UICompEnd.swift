//
//  UICompEnd.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 27/06/2024.
//

import SwiftData
import SwiftUI

struct UICompEnd: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    var uiData: UIData
    let lessonId: Int
    
    var body: some View {
        LazyVStack {
           Text("")
                .onAppear{ lessonComplete() }
        }
        .padding()
    }
    
    func lessonComplete() {
        switch lessonId {
        case 00: lesson000Complete()
        default: print("Error: UICompEnd, LessonId: \(lessonId)")
        }
        
    }
    
    func lesson000Complete() {
        userConfig[0].isLessonComplete[000] = true
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
    
    return UICompEnd(uiData: uiData, lessonId: 00)
                .environmentObject(AppController())
                .modelContainer(for: [WeighWeek.self, UserConfig.self])
}