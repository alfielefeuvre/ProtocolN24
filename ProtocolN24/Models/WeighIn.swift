//
//  WeighIn.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import Foundation
import SwiftData

@Model
class WeighIn: Comparable {
    var weekOfYear: Int = 0
    var dayOfWeek: Int = 0
    var date: Date = Date()
    var weight: Double = 0
    var weighWeek: WeighWeek?

    init(weekOfYear: Int = 0, dayOfWeek: Int = 0, weight: Double = 0, date: Date) {
        self.weekOfYear = weekOfYear
        self.dayOfWeek = dayOfWeek
        self.weight = weight
        self.date = date
    }
    
    static func <(lhs: WeighIn, rhs: WeighIn) -> Bool {
        return lhs.dayOfWeek < rhs.dayOfWeek
    }
}
