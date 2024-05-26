//
//  Lesson090.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson090: NSObject, ObservableObject {
    
    var lesson090 = Lesson(id: 090, headline: "Headline",
                           dayRef: "Lesson 9",
                           module: .week3,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [])
}
