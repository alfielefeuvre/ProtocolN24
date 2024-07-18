//
//  Lesson040.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson040: NSObject, ObservableObject {
    
    var lesson040 = Lesson(id: 040, headline: "Secret 3: Fat-loss process  \n",
                           dayRef: "Day 5",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Dumbell", uiComponents: [UIComponent(type: .uiHeader, uiData: UIData(uiText: "How to control your weight - II", uiText2: "",
                                                                                                        uiImage: "Bench", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                        uiSegPickerOptions: ["xx"])),
                                                            
                                                         UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                In secret 2 we learnt how to control our bodyweight:
                                                                                                
                                                                                                If we take in more energy (food/drink) than we burn (movement/exercise), our body stores this energy as fat.
                                                                                                                                                                                                   
                                                                                                If we burn more energy than we take in, our body burns our fat stores to meet the demands of our movement and exercise.
                                                                                                
                                                                                                So how does this work in real life?
                                                                                                
                                                                                                First we track our daily energy consumption (check out secret 4 for more info on this):
                                                                                                """, uiText2: "xx",
                                                                                                         uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                         uiSegPickerOptions: ["xx"])),
                                                            
                                                              UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                      uiImage: "WeightControl1", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     Below the balance point we can expect to lose weight, if this is supported with training/nutrition this will mostly be from fat stores on the body. The further we are below the balance point, the more weight we will lose.
                                                                                                     """, uiText2: "xx",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                                 
                                                                   UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                           uiImage: "WeightControl2", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     If we push the weight loss too far, this can impact on mood/hunger and attention.
                                                                                                     
                                                                                                     For the 8-week programme, a maximum of 1.2% weight loss per week is expected. This is monitored closely so that we don’t run into energy/mood/hunger/attention issues.
                                                                                                     """, uiText2: "xx",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                                 
                                                                   UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                           uiImage: "WeightControl4", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     Anything beyond 1.2% is likely to lead to problems and eventual diet break/over-eating.
                                                                                                                                                                                                          
                                                                                                     Below 1.2% and it is likely that we will see some muscle loss, which for most people is the opposite of the training goals.
                                                                                                                                                                                                       
                                                                                                     Above the balance point is where we are consuming more energy than we need, this state supports muscle growth because our body has spare energy and can decide to assign it to muscle growth to support our training.
                                                                                                     """, uiText2: "xx",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                                 
                                                                   UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                           uiImage: "WeightControl8", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                                   uiSegPickerOptions: ["xx"])),
                                                              
                                                            UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                    At first, the more energy we have spare, the more muscle we will grow.
                                                                                                                                                                                                        
                                                                                                    If we continue to consume more energy we will reach a point where all the additional energy is stored as fat.
                                                                                                   """, uiText2: "UI Text 22 ",
                                                                                                            uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                            uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                      uiImage: "WeightControl7", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     Ideally, we want to between the balance point and the top of the training zone.
                                                                                                     
                                                                                                     People new to training will experience rapid muscle growth, beginners luck or the honeymoon period.
                                                                                                     
                                                                                                     This can be as much as a gain of 1.5% bodyweight per month, but for some people (especially advanced trainers,) this can be lower.
                                                                                                    """, uiText2: "UI Text 22 ",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                      uiImage: "WeightControl6", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                     We want to aim for the sweet-spot to support our target weight.
                                                                                                     """, uiText2: "UI Text 22 ",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
                                                                                      uiImage: "WeightControl5", ratioOfDeviceWidth: 1, imageRatio: 0.6,
                                                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiTextString, uiData: UIData(uiText: """
                                                                                                        If fat loss is our aim we want to be below the balance point by a sufficient amount to initiate fat loss, but not so much that we lose muscle or suffer from a lack or energy/mood issues, hunger of attention issues.
                                                                                                     """, uiText2: "UI Text 22 ",
                                                                                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                                              uiSegPickerOptions: ["xx"])),
                                                              
                                                              UIComponent(type: .uiEnd, uiData: UIData(uiText: "xx", uiText2: "xx", uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
                                                                                  uiSegPickerOptions: ["xx"]))
                           ])
}

////
//
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                       Below the balance point we can expect to lose weight, if this is supported with training/nutrition this will mostly be from fat stores on the body. The further we are below the balance point, the more weight we will lose.
//                                       """, uiText2: "xx",
//                                                uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                                uiSegPickerOptions: ["xx"])),
//   
//     UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                             uiImage: "WeightControl2", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                     uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                       If we push the weight loss too far, this can impact on mood/hunger and attention.
//                                       
//                                       For the 8-week programme, a maximum of 1.2% weight loss per week is expected. This is monitored closely so that we don’t run into energy/mood/hunger/attention issues.
//                                       """, uiText2: "xx",
//                                                uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                                uiSegPickerOptions: ["xx"])),
//   
//     UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                             uiImage: "WeightControl4", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                     uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                       Anything beyond 1.2% is likely to lead to problems and eventual diet break/over-eating.
//                                                                                                                                            
//                                       Below 1.2% and it is likely that we will see some muscle loss, which for most people is the opposite of the training goals.
//                                                                                                                                         
//                                       Above the balance point is where we are consuming more energy than we need, this state supports muscle growth because our body has spare energy and can decide to assign it to muscle growth to support our training.
//                                       """, uiText2: "xx",
//                                                uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                                uiSegPickerOptions: ["xx"])),
//   
//     UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                             uiImage: "WeightControl8", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                     uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                      At first, the more energy we have spare, the more muscle we will grow.
//                                                                                                                                          
//                                      If we continue to consume more energy we will reach a point where all the additional energy is stored as fat.
//                                     """, uiText2: "UI Text 22 ",
//                                              uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                              uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                        uiImage: "WeightControl7", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                uiSegPickerOptions: ["xx"])),
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                       Ideally, we want to between the balance point and the top of the training zone.
//                                       
//                                       People new to training will experience rapid muscle growth, beginners luck or the honeymoon period.
//                                       
//                                       This can be as much as a gain of 1.5% bodyweight per month, but for some people (especially advanced trainers,) this can be lower.
//                                      """, uiText2: "UI Text 22 ",
//                                                uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                                uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                        uiImage: "WeightControl6", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                       We want to aim for the sweet-spot to support our target weight.
//                                       """, uiText2: "UI Text 22 ",
//                                                uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                                uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiImageName, uiData: UIData(uiText: "xx", uiText2: "xx",
//                        uiImage: "WeightControl5", ratioOfDeviceWidth: 1, imageRatio: 0.6,
//                                                                                uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiTextString, uiData: UIData(uiText: """
//                                          If fat loss is our aim we want to be below the balance point by a sufficient amount to initiate fat loss, but not so much that we lose muscle or suffer from a lack or energy/mood issues, hunger of attention issues.
//                                       """, uiText2: "UI Text 22 ",
//                                                uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                                                uiSegPickerOptions: ["xx"])),
//
//UIComponent(type: .uiEnd, uiData: UIData(uiText: "xx", uiText2: "xx", uiImage: "xx", ratioOfDeviceWidth: 0, imageRatio: 0,
//                    uiSegPickerOptions: ["xx"]))
//])
//}
