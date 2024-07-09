//
//  Lesson.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 16/05/2024.
//

import Foundation
import SwiftUI

struct Lesson: Identifiable, Codable {
    var id: Int
    var headline: String
    var dayRef: String
    var module: Module
    var isComplete: Bool
    var isLocked: Bool
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var uiComponents: [UIComponent]
}

struct UIComponent: Identifiable, Codable {
    var id: UUID = .init()
    var type: UIComponentType
    var uiData: UIData
}

enum UIComponentType: String, CaseIterable, Codable {
    case uiEnd = "End"
    case uiHeader = "Header"
    case uiImageName = "Image"
    case uiQandA = "Q & A"
    case uiSegPicker = "Segmented Picker"
    case uiStepper = "Stepper Int"
    case uiTextString = "Text"
    case uiWIChart = "WeighIn Chart"
}

struct UIData: Codable {
    // Text
    var uiText: String
    var uiText2: String 
    
    // Image
    var uiImage: String
    var ratioOfDeviceWidth: Double
    var imageRatio: Double
    
    // Segmented Picker - Text
    var uiSegPickerOptions: [String]

    
    
    
}

