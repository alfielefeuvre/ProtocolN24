//
//  Lesson.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/05/2024.
//

import Foundation
import SwiftUI

struct Lesson {
    var id: Int
    var headlineText: String
    var subHeadline: String
    var tenTextStrings: [String]
    
    var module: Module
    enum Module: String, CaseIterable, Codable {
        case quickStart = "Quick Start"
        case module1 = "Module 1"
        case module2 = "Module 2"
    }
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
}
