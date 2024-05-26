//
//  Lesson020.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson020: NSObject, ObservableObject {
    
    var lesson020 = Lesson(id: 020, headline: "How do you know ProtocolN24 will work?",
                           dayRef: "Lesson 2",
                           module: .week1,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Dumbell", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                            uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                                
                                                             UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                     The truth is you don't know for a fact that any training programme will work. That is why ProtocolN24 enables you to monitor progress.
                                                     
                                                     In simple terms, if your target is fat loss, your body weight should be dropping each week. If your strength increases or stays the same during this period, the change in bodyweight is probably from fat rather than muscle loss.
                                                                                                          
                                                     If your focus is muscle gain, you should see your strength improve over a range of exercises while your bodyweight increases within a sensible range.
                                                     
                                                     ProtocolN24 helps you to monitor strength and bodyweight so that you can be confident that your training is heading in the right direction.
                                                     
                                                     """, uiText2: "UI Text 22 ",
                                                                                                             uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                             uiSegPickerOptions: ["xx"])),
                                                                
                                                                UIComponent(type: .uiImageName, uiData: UIData(uiText: """
                                                     So what are sensible ranges for fat loss?
                                                     
                                                     Protocol24 targets between 0.5% and 1.2% fat loss per week. Any more than this and too much muscle mass will be lost, strength gains will deteriorate. Controlling hunger and mood with more than 1.2% fat loss per week will be challenging.
                                                     
                                                     On average, people who target fat loss will lose __% of their bodyweight during this 8-week programme.
                                                     
                                                     How does this look for you?
                                                     """, uiText2: "Sub-Header",
                                                                                                                                                 uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                 uiSegPickerOptions: ["xx"])),
                                                                
                                                                UIComponent(type: .uiTextString, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                                                                 uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                 uiSegPickerOptions: ["xx"])),
                                                                
                                                             ])

}
