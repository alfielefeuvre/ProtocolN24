//
//  Lesson070.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson070: NSObject, ObservableObject {
    
    var lesson070 = Lesson(id: 070, headline: "How you can build muscle",
                           dayRef: "Day 9",
                           module: .week2,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Bench", uiComponents: [])
}
