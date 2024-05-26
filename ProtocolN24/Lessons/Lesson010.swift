//
//  Lesson010.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson010: NSObject, ObservableObject {
    
    var lesson010 = Lesson(id: 010, headline: "What can ProtocolN24 do for you?",
                           dayRef: "Day 1 (1/3)",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "run-634702_1920", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                                                   uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                                                       
                                                                                    UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                            ProtocolN24 has two settings: 'Fat Loss' and 'Muscle Gain'.
                                                                            
                                                                            Our first task is to decide which one of these targets is best for you. 
                                                                            
                                                                            For some people this will be an obvious decision, for those people, scroll down to the bottom of this page, make your selection and move on.
                                                                            
                                                                            For those that are unsure or if you would like both 'Fat Loss' and 'Muscle Gain', here are some things you should know before you chose a setting:
                                                                            
                                                                            The majority of people that select 'Fat Loss' will also gain some strength (4% on average).
                                                                            
                                                                            The majority of people who select 'Muscle Gain' will not lose any fat.
                                                                            
                                                                            Would you be happy gaining a little body fat over the next 4 or 5 months? If this is ok, select 'Muscle Gain'.
                                                                            
                                                                            If you would like both 'Muscle Gain' and 'Fat Loss', select 'Fat Loss' and trim down to a weight you are happy with, then we'll transition to 'Muscle Gain'
                                                                            
                                                                            Still undecided? Choose 'Fat Loss'.
                                                                            
                                                                            """, uiText2: "UI Text 22 ",
                                                                                                                                    uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                    uiSegPickerOptions: ["xx"])),
                                                                                       
                                                                                       UIComponent(type: .uiSegPicker, uiData: UIData(uiText: "Select your setting...", uiText2: "Lesson 1",
                                                                                                                                      uiImage: "Gym", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                      uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])),
                                                                        
                                                                        UIComponent(type: .uiQandA, uiData: UIData(uiText: "Question 1", uiText2: "Answer 1",
                                                                                                                       uiImage: "Gym", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                       uiSegPickerOptions: ["xx", "xx", "xx"]))
                                                                                    ])
}
