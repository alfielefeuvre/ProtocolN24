//
//  Lesson020.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation
import SwiftUI
import SwiftData

class Lesson020: NSObject, ObservableObject {
    @EnvironmentObject var appController: AppController
    
    var lesson020 = Lesson(id: 020, headline: "How do you know it will work?",
                           dayRef: "Day 1 (3/5)",
                           module: .week1,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Dumbell", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "How do you know it will work?", uiText2: "",
                                                                                                            uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                                
                                                             UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                     The truth is that you don’t know for a fact that any training programme will work for you. That is why ProtocolN24 enables you to monitor progress.

                                                     In simple terms, if your target is fat loss, your bodyweight should be dropping over time (ideally each week). Protocol N24 makes it easy to track your bodyweight so you can be confident that you are on the right track.

                                                     If your bodyweight is dropping over time and your strength is staying the same (or increasing slightly), you are probably losing fat rather than muscle.   
                                                     If your focus is muscle gain, you should see your strength improve over a range of exercises while your bodyweight increases within a sensible range.

                                                     ProtocolN24 makes it easy to monitor strength and bodyweight so that you can be confident that your nutrition/training is heading in the right direction.

                                                     Now that we have an aim for our training (‘Fat Loss’ or ‘Muscle Gain’), it is time to set an ambitious (yet entirely achievable) 8-week target weight. 
                                                     
                                                     Select your weight below and ProtocolN24 will calculate your 8-week target.
                                                     
                                                     """, uiText2: "xx",
                                                                                                             uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                             uiSegPickerOptions: ["xx"])),
                                                                
                                                                UIComponent(type: .uiStepper, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                                                                 uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                 uiSegPickerOptions: ["xx"]))
                                                             ])

}
