//
//  UICompWCChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 18/07/2024.
//

import SwiftUI

struct UICompWCChart: View {
    var uiData: UIData
    
    var body: some View {
        ZStack {
            DemoWeighCalChart(displayBoth: uiData.uiText == "true" ? true : false)
        }
    }
}

#Preview {
    
    let uiData = UIData(uiText: "true",
                        uiText2: "true",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0,
                        uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])
    
    return UICompWCChart(uiData: uiData)
                .environmentObject(AppController())
                .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
