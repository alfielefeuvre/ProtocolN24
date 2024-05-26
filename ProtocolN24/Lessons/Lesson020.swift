//
//  Lesson020.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/05/2024.
//

import Foundation

class Lesson020: NSObject, ObservableObject {
    
    var lesson020 = Lesson(id: 020,
                           dayRef: "Lesson 2",
                           module: .week1,
                           isComplete: false, 
                           isLocked: false,
                           imageName: "Dumbell", uiComponents: [])
}
