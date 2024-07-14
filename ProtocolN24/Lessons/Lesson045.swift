//
//  Lesson045.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 08/07/2024.
//

import Foundation

class Lesson045: NSObject, ObservableObject {
    
    var lesson045 = Lesson(id: 045, headline: "Enjoy the food you love (booze is not band)",
                           dayRef: "Day 6",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Bench", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "How to control your weight - III", uiText2: "",
                                                                                                        uiImage: "Bench", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                        uiSegPickerOptions: ["xx"])),
                                                            
                                                         UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                The first thing we should do is to set a base line of where our bodyweight currently is. To do this we collect some data by recording our bodyweight each morning.
                                                                                                """, uiText2: "xx",
                                                                                                         uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                         uiSegPickerOptions: ["xx"])),
                                                            
                                                              UIComponent(type: .uiWIChart, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                      uiImage: "xx", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                    uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     Next we display an average for these data points, this brings the data to life. Using this information, we can start to see trends in our bodyweight.
                                                                                                     
                                                                                                     If our body weight is dropping over time, the line will move down.
                                                                                                     """, uiText2: "xx",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                                 
                                                              UIComponent(type: .uiWIChart, uiData: UIData(uiText: "true", uiText2: "xx",
                                                                                      uiImage: "xx", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                    uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     If our body weight is increasing overtime, the line will move up.
                                                                                                     """, uiText2: "xx",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                                 
                                                                   UIComponent(type: .uiWIChart, uiData: UIData(uiText: "true", uiText2: "xx",
                                                                                           uiImage: "Calorie7-DayAvg", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                              
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                   This is a great way to observe changes in our bodyweight, but it's only half the story.
                                                                                                            
                                                                                                   We are focused on our bodyweight because this is what we would like to change.
                                                                                                        
                                                                                                   The change in our body weight is the output of this process. We now need to focus on the inputs...
                                                                                                            
                                                                                                   So what factors can influence our bodyweight? Let's assume that our training, stress levels and sleep are constant, we can investigate the factor that has the biggest influence on our bodyweight: How much energy is in our food/drink.
                                                                                                            
                                                                                                   Let's follow the same process and chart the amount of energy we consume.
                                                                                                   
                                                                                                   Using the same 7-day average that we used before, we can see trends in energy consumption. In this example, the energy intake drops after two days.
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                      uiImage: "BodyweightCalorie7-DayAvg", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     The picture becomes clear when we compare the energy consumption (input) and bodyweight (output) at the same time.
                                                                                                    
                                                                                                    The biggest influence on our bodyweight is energy consumption and that is why ProtocolN24 makes this easy to track in the 'Food & Drink' tab.
                                                                                                    """, uiText2: "UI Text 22 ",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiEnd, uiData: UIData(uiText: "xx", uiText2: "xx", uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                  uiSegPickerOptions: ["xx"]))
                           ])
}
