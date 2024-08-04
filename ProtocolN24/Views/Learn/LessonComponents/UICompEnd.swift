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
        case 000: lesson000Complete()
        case 030: lesson030Complete()
        case 040: lesson040Complete()
       default: print("Error: UICompEnd, LessonId: \(lessonId)")
        }
        
    }
    
    func lesson000Complete() {
        userConfig[0].isLessonComplete[000] = true
        save()
    }
    func lesson030Complete() {
        userConfig[0].isLessonComplete[030] = true
        save()
    }
    
    func lesson040Complete() {
        userConfig[0].isLessonComplete[040] = true
        save()
    }
    
    func save() {
        try? modelContext.save()
        appController.updateLessonsWithUserConfig(userConfig: userConfig[0])
    }
}
