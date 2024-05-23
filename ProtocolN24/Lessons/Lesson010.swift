//
//  Lesson010.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson010: NSObject, ObservableObject {
    
    let lesson010 = Lesson(id: 010,
                           dayRef: "Day 1 (1/3)",
                           headlineText: "What will ProtocolN24 do for me?",
                           subHeadline: "Lesson010",
                           module: .week1,
                           imageName: "run-634702_1920", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                                                   uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                   uiSegPickerOptions: ["xx"],
                                                                                                                                   uiQuestion: "xx", uiAnswer: "xx")),
                                                                                       
                                                                                       UIComponent(type: .uiImageName, uiData: UIData(uiText: "String from App Demo Data", uiText2: "UI Text No.2",
                                                                                                                                      uiImage: "Gym", ratioOfDeviceWidth: 0.5, imageRatio: 1,
                                                                                                                                      uiSegPickerOptions: ["xx"],
                                                                                                                                      uiQuestion: "App Demo Q1", uiAnswer: "App Demo A1")),
                                                                                       
                                                                                       UIComponent(type: .uiSegPicker, uiData: UIData(uiText: "Select your setting...", uiText2: "Lesson 1",
                                                                                                                                      uiImage: "Gym", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                      uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"],
                                                                                                                                      uiQuestion: "xx", uiAnswer: "xx")),
                                                                                       
                                                                                       UIComponent(type: .uiTextString, uiData: UIData(uiText: "String 22from App Demo Data", uiText2: "UI Text 22 ",
                                                                                                                                       uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                       uiSegPickerOptions: ["xx"],
                                                                                                                                       uiQuestion: "xx", uiAnswer: "xx"))
                                                                                    ])
    
}
