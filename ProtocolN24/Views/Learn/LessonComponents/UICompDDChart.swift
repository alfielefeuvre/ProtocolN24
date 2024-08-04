//
//  UICompDDChart.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 03/08/2024.
//
import SwiftData
import SwiftUI

struct UICompDDChart: View {
    @EnvironmentObject var appController: AppController
    var uiData: UIData
    
    var body: some View {
        ZStack {
            DailyChart(dataToDisplay: appController.lesson3ChartData)
        }
    }
}

#Preview {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: DayData.self, configurations: config)
    
    let uiData = UIData(uiText: "true",
                        uiText2: "true",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0.7,
                        uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])
    
    return UICompDDChart(uiData: uiData)
                .environmentObject(AppController())
                .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
