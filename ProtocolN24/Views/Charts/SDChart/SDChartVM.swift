//
//  SDChartVM.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 10/02/2025.
//

import Charts
import Foundation
import SwiftUI

extension SDChart {
    @Observable
    class ViewModel {
        let oldestDate = Date() - (14 *  86401) // last 14 days
        let viewWidth = UIScreen.main.bounds.width * 0.85
        var chartYAxisUpper: Double = 30
        var chartYAxisLower: Double = 0
        var fatLossKg: Double = 0
        var fatLossPercent: Double = 0
        
        
    }
}

