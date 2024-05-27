//
//  Lesson030.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson030: NSObject, ObservableObject {
    
    var lesson030 = Lesson(id: 030, headline: "Energy Balance",
                           dayRef: "Day 1 (3/3)",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                        uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                        uiSegPickerOptions: ["xx"])),
                                                            
                                                         UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                Energy balance
                                                                                                """, uiText2: "UI Text 22 ",
                                                                                                         uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                         uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiSegPicker, uiData: UIData(uiText: """
                                                                                                   Energy balance
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"]))
                           
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                           
                           ])
}
