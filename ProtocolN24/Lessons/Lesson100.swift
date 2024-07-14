//
//  Lesson100.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/07/2024.
//

import Foundation

class Lesson100: NSObject, ObservableObject {
    
    var lesson100 = Lesson(id: 100, headline: "Headline",
                           dayRef: "Day 12",
                           module: .week2,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [])
}
