//
//  Lesson000.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 22/06/2024.
//

import Foundation

class Lesson000: NSObject, ObservableObject {
    
    var lesson000 = Lesson(id: 000, headline: "START HERE!  \n",
                           dayRef: " ",
                           module: .quickStart,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "ProtocolN24", uiText2: "START HERE!",
                                                                                                                                   uiImage: "Gym", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                                                   
                                                                                    UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                                            uiImage: "BeforeAfter1", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                                    uiSegPickerOptions: ["xx"])),
                                                            
                                                                                     UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                             The people who’ve had success with '10 Secrets to Shredded' faced the same challenges as you.
                                                                             
                                                                             Some of them had limited time to train, some were lacking in energy, some have always been heavy, for others the weight has crept up in the last few years.
                                                                             """, uiText2: "UI Text 22 ",
                                                                                                                                     uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                     uiSegPickerOptions: ["xx"])),
                                                            
//                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                                                                                    uiImage: "BeforeAfter2", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                    This protocol works for people in all walks of life, whether you are new to fitness or if you are looking to re-kindle the performance from your past.

                                                    If you are prepared to put in the work, '10 Secrets to Shredded' will show you, step-by-step, how to get results.
                                                    """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
//                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                                                                                    uiImage: "BeforeAfter3", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                    We know you are the kind of person who wants to have pride in how your body looks and performs. In order to do this, you need to know how to get rid of excess fat and build lean muscle.

                                                    The problem is most people don’t have a protocol for fat loss and muscle gain which is why so many people get frustrated with unrealistic diets and the latest influencer fads.
                                                    """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "BeforeAfter4", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                    We believe people should have the knowledge to take ownership for their nutrition/training so that they can build the body that they want.

                                                    We understand that without a structured plan, training can leave you exhausted and still stuck with the same body that never quite looks right in a t-shirt.
                                                    """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "BeforeAfter1", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                    If you'd like to know more about our protocol, we give away our '10 Secrets to Shredded' on a regular basis. This will teach you all you need to know to get started building the body that you dream about.
                                                    
                                                    Here’s how it works:

                                                    1) Check the '10 Secrets to Shredded', its free, enjoy. No sign-up or email address required.
                                                    
                                                    2) Learn our tried and tested methods for fat loss and muscle gain.
                                                    
                                                    3) Take ownership for how your body looks and performs.
                                                    """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiEnd, uiData: UIData(uiText: "xx", uiText2: "xx", uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                uiSegPickerOptions: ["xx"]))
                                                                                                                        
                                                                                    ])
}
