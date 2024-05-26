//
//  Lesson030.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson030: NSObject, ObservableObject {
    
    var lesson030 = Lesson(id: 030,
                           dayRef: "Lesson 3",
                           module: .week1,
                           isComplete: false, isLocked: false,
                           imageName: "Gym", uiComponents: [])
}
