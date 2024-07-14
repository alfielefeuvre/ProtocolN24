//
//  Lesson080.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson080: NSObject, ObservableObject {
    
    var lesson080 = Lesson(id: 080, headline: "Headline",
                           dayRef: "Day 10",
                           module: .week2,
                           isComplete: false, isLocked: false,
                           imageName: "Bench", uiComponents: [])
}
