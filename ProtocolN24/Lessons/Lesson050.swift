//
//  Lesson050.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson050: NSObject, ObservableObject {
    
    var lesson050 = Lesson(id: 050, headline: "Headline",
                           dayRef: "Lesson 5",
                           module: .week2,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Gym", uiComponents: [])
}
