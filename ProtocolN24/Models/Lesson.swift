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
    
    var uiComponents: [UIComponent]
}

struct UIComponent: Identifiable, Codable {
    var id: UUID = .init()
    var type: UIComponentType
    var uiData: UIData
}

enum UIComponentType: String, CaseIterable, Codable {
    case uiHeader = "Header"
    case uiImageName = "Image"
    case uiNextLesson = "Next Lesson"
    case uiSegPicker = "Segmented Picker"
    case uiTextString = "Text"
   
}

struct UIData: Codable {
    // Text
    var uiText: String
    var uiText2: String 
    
    // Image
    var uiImage: String
    var ratioOfDeviceWidth: Double
    var imageRatio: Double
    
    // Segmented Picker
    var uiSegPickerOptions: [String]
    
    // FAQ
    var uiQuestion: String
    var uiAnswer: String

}

