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
    do {
        let previewer = try Previewer()
        
        let uiData = UIData(uiText: "true",
                            uiText2: "true",
                            uiImage: "xx",
                            ratioOfDeviceWidth: 1,
                            imageRatio: 0.7,
                            uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])
        
        return UICompDDChart(uiData: uiData)
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
