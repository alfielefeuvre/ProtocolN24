//
//  WeighWeek.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import Foundation
import SwiftData

@Model
class WeighWeek {
    var weekRef: Int = 0
    var averageWeight: Double = 0
    var isAverageValid: Bool = false
    
    @Relationship(deleteRule: .cascade, inverse: \WeighIn.weighWeek) var weighIns: [WeighIn]? = []
   
    init(weekRef: Int = 0) {
        self.weekRef = weekRef
    }
}
