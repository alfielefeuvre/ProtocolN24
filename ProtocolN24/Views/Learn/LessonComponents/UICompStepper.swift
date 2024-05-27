//
//  UICompStepper.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 27/05/2024.
//

import SwiftUI
import SwiftData

struct UICompStepper: View {
    @EnvironmentObject var appController: AppController
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
  
    var lessonId: Int
    @State private var selectedInt: Int = 90
    @State private var summaryText = ""
    
    var body: some View {
        VStack {
            Stepper("\(selectedInt.formatted()) kg",
                    value: $selectedInt,
                    in: 30...300, step: 1)
            .padding()
            
            HStack {
                Spacer()
                Button("Confirm") { selectionConfirmed() }
            }.padding(.trailing)
            
            Text(summaryText)
                .padding(.top)
            
        }.padding()
            .onAppear{ setDefaultValues() }
    }
    
    func setDefaultValues() {
        switch lessonId {
        case 20: lesson20Setup()
        default: print("Error: UICompStepper: setDefaultValues(): lessonId: \(lessonId)")
        }
    }
    
    func lesson20Setup() {
        if userConfig[0].startBodyweightKG == 0 {
            print(": \(userConfig[0].cutOrBulk)")
            if userConfig[0].cutOrBulk == "Muscle Gain" {
                selectedInt = 45
            }
        } else {
            selectedInt = userConfig[0].startBodyweightKG
        }
        summaryText = "Expected fat loss: \(String(format: "%.1f", Double(userConfig[0].startBodyweightKG) * 0.06)) kg"
    }
    
    func selectionConfirmed() {
        switch lessonId {
        case 20: assignBodyWeight(inKG: selectedInt)
        default: print("Error: UICompStepper: selectionConfirmed(): lessonId: \(lessonId)")
        }
    }
    
    func assignBodyWeight(inKG: Int) {
        userConfig[0].isLessonComplete[20] = true
        userConfig[0].startBodyweightKG = inKG
        try? modelContext.save()
        appController.updateLessonsWithUserConfig(userConfig: userConfig[0])
        summaryText = "Expected fat loss: \(String(format: "%.1f", Double(userConfig[0].startBodyweightKG) * 0.06)) kg"
    }
    
    
    
    
}

#Preview {
    UICompStepper(lessonId: 20)
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
