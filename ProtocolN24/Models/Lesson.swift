//
//  Lesson.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/05/2024.
//

import Foundation
import SwiftUI

struct Lesson: Identifiable {
    var id: Int
    var dayRef: String 
    var headlineText: String
    var subHeadline: String
    var tenTextStrings: [String]
    var tenImageStrings: [String]
    var tenQuestions: [String]
    var tenAnswers: [String]
    var module: Module
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
}
