//
//  Lesson110.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/07/2024.
//

import Foundation

class Lesson110: NSObject, ObservableObject {
    
    var lesson110 = Lesson(id: 110, headline: "Headline",
                           dayRef: "Day 13",
                           module: .week2,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [])
}
