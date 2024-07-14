//
//  Lesson120.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/07/2024.
//

import Foundation

class Lesson120: NSObject, ObservableObject {
    
    var lesson120 = Lesson(id: 120, headline: "Headline",
                           dayRef: "Day 14",
                           module: .week2,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [])
}
