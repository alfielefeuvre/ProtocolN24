//
//  Lesson000.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 22/06/2024.
//

import Foundation

class Lesson000: NSObject, ObservableObject {
    
    var lesson000 = Lesson(id: 000, headline: "ProtocolN24",
                           dayRef: "START HERE!",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "Header", uiText2: "Sub-Header",
                                                                                                                                   uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                                                       
                                                                                    UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                            [before/after images]
                                                                            
                                                                            [testimonials]
                                                                            
                                                                            Fat loss: average 6% in 12 weeks
                                                                            
                                                                            Strength gain: average 4% in 6 weeks
                                                                            
                                                                            The people who’ve had this success faced the same challenges as you. 
                                                                            
                                                                            Some of them had limited time to train, some where lacking in energy, some have always been skinny, some have always been heavy.
                                                                            
                                                                            This protocol works for people in all walks of life, whether you are new to fitness or if you are looking to re-establish performance from your past.
                                                                            
                                                                            If you are prepared to put in the work, ProtocolN24 will show you, step-by-step how to get results.
                                                                            
                                                                            At ProtocolN24 we know you are the kind of person who wants to have pride in how your body looks and performs. 
                                                                            
                                                                            In order to do this, you need to know how to get rid of the excess fat and build lean muscle.
                                                                            
                                                                            The problem is most people don’t have a protocol for fat loss and muscle gain which is why so many people get frustrated with unrealistic diets and the latest fads.

                                                                            We believe people should have the knowledge to take ownership for their nutrition/training so that they can build the body that they want.

                                                                            We understand that without a structured plan, training can leave you exhausted and still stuck with the same body that never quite looks right in a t-shirt.

                                                                            That’s why we have developed an 8-week process that will teach you all you need to know to get started building the body that you dream about. Here’s how it works:
                                                                            
                                                                            1) Check our first module ‘[name tbc], its yours, its free, enjoy. No sign-up or email address required.
                                                                            
                                                                            2) Learn our tried and tested methods for fat loss and muscle gain.
                                                                            
                                                                            3) Take ownership for how your body looks and performs.
                                                                            """, uiText2: "UI Text 22 ",
                                                                                                                                    uiImage: "Bench", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                                    uiSegPickerOptions: ["xx"]))
                                                                                    ])
}
