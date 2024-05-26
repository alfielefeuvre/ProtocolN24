//
//  Lesson070.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson070: NSObject, ObservableObject {
    
    var lesson070 = Lesson(id: 070, headline: "Headline",
                           dayRef: "Lesson 7",
                           module: .week2,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Bench", uiComponents: [])
}
