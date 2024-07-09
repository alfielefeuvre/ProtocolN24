//
//  UICompWIChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 09/07/2024.
//

import SwiftUI

struct UICompWIChart: View {
    var uiData: UIData
    
    var body: some View {
        ZStack {
            WeighInChart(includeAverage: uiData.uiText == "true" ? true : false ,
                         includeAveragePoint: uiData.uiText2 == "true" ? true : false )
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
    
    return UICompWIChart(uiData: uiData)
                .environmentObject(AppController())
                .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
