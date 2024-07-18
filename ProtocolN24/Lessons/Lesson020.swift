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
    
    var lesson020 = Lesson(id: 020, headline: "Secret 1: How do you know a programme will work?",
                           dayRef: "Day 3",
                           module: .week1,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Bench", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "How do you know it will work?", uiText2: "",
                                                                                                            uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                                
                                                             UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                     The truth is that you don’t know for a fact that any training programme will work for you. That is why ProtocolN24 enables you to monitor your progress.

                                                     In simple terms, if your target is fat loss, your bodyweight should be dropping over time (ideally each week). Protocol N24 makes it easy to track your bodyweight so you can be confident that you are on the right track.

                                                     If your bodyweight is dropping over time and your strength is staying the same (or increasing slightly), you are probably losing fat rather than muscle.  
                                                     
                                                     If your focus is muscle gain, you should see your strength improve over a range of exercises while your bodyweight increases within a sensible range.

                                                     So how does this work in real life?
                                                                                                                                                         
                                                     The first thing we do is to collect some information, so we record our bodyweight each morning.
                                                     """, uiText2: "xx",
                                                                uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                uiSegPickerOptions: ["xx"])),
                                                              
                                                                 
                                                                   UIComponent(type: .uiWIChart, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                           uiImage: "xx", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                         uiSegPickerOptions: ["xx"])),
                                                                   
                                                                   UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                          Next we display an average for these data points, this brings the data to life. Using this information, we can start to see trends in our bodyweight.
                                                                                                          
                                                                                                          If our bodyweight is dropping over time, the line will move down.
                                                                                                          """, uiText2: "xx",
                                                                                                                   uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                                      
                                                                   UIComponent(type: .uiWIChart, uiData: UIData(uiText: "true", uiText2: "xx",
                                                                                           uiImage: "xx", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                         uiSegPickerOptions: ["xx"])),
                                                                   
                                                                   UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                          If our bodyweight is increasing overtime, the line will move up. This is a great way to observe changes and we can use this process to confirm that our fitness is on track.
                                                                                                          """, uiText2: "xx",
                                                                                                                   uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                                      
                                                                        UIComponent(type: .uiWIChart, uiData: UIData(uiText: "true", uiText2: "xx",
                                                                                                uiImage: "Calorie7-DayAvg", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                        uiSegPickerOptions: ["xx"])),
                                                            
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                      So what is a realistic expectation for fat loss/muscle gain? Select your bodyweight below and ProtocolN24 will calculate your 8-week target.
                                                      
                                                      """, uiText2: "xx",
                                                                                                              uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              
                                                                UIComponent(type: .uiStepper, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                                                                 uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                 uiSegPickerOptions: ["xx"]))
                                                             ])

}
