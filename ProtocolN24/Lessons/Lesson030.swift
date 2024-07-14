//
//  Lesson030.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson030: NSObject, ObservableObject {
    
    var lesson030 = Lesson(id: 030, headline: "How to control your weight",
                           dayRef: "Day 4",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "How to control your weight", uiText2: "",
                                                                                                        uiImage: "Dumbell", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                        uiSegPickerOptions: ["xx"])),
                                                            
                                                         UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                Controlling your bodyweight is often overcomplicated when people try to sound clever by using terms like glycogen and enzymes.
                                                                                                
                                                                                                We are going to explain the main principal surrounding weight loss/gain using a simple water bottle example.
                                                                                                """, uiText2: "xx",
                                                                                                         uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                         uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "EnergyBal1", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                   If we add water to the bottle then the water level in the bottle rises.
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "EnergyBal2", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                   If we draw water from the bottle, the water level falls.
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "EnergyBal3", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                   Over the course of a day, if we add more water than we use, the level rises, if we use more water than we add to the dispenser, the level falls. 
                                                                                                   
                                                                                                   If there is a balance between how much water we add and how much is drawn, there is no change in the water level.
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "EnergyBal4", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                   Most people can picture this concept of balancing of water in vs water out and how it relates to the level of water in the bottle. 
                                                                                                   
                                                                                                   At a basic level, this is what happens each day in you body when you take in energy through food/drink and you burn energy through movement and exercise.

                                                                                                   If we take in more energy (food/drink) than we burn (movement/exercise), our body stores this energy as fat.
                                                                                                   
                                                                                                   If we burn more energy than we take in, our body burns our fat stores to meet the demands of our movement and exercise.
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                    uiImage: "EnergyBal5", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                            uiSegPickerOptions: ["xx"])),
                                                            
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                   So how do you track this in real life? You track food/drink consumption using the 'Food & Drink' tab.
                                                                                                   
                                                                                                   The 'Workout' tab will guide you through resistance training.
                                                                                                   
                                                                                                   And, you can track your progress using the 'Progress' tab.
                                                                                                   
                                                                                                   Finally the 'Learn" tab will provide you with the knowledge that you need to take ownership for how your body looks and performs.
                                                                                                   
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                               
                                                                                            UIComponent(type: .uiEnd, uiData: UIData(uiText: "xx", uiText2: "xx", uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                                uiSegPickerOptions: ["xx"]))
                                ])
}
