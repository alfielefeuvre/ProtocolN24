//
//  Lesson100.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/07/2024.
//

import Foundation

class Lesson100: NSObject, ObservableObject {
    
    var lesson100 = Lesson(id: 100, headline: "Bonus: What you'll need for this to work",
                           dayRef: "Day 12",
                           module: .week2,
                           isComplete: false, isLocked: false,
                           imageName: "Bench", uiComponents: [])
}
