//
//  Lesson040.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson040: NSObject, ObservableObject {
    
    var lesson040 = Lesson(id: 040, headline: "Headline",
                           dayRef: "Lesson 4",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Bench", uiComponents: [])
}
