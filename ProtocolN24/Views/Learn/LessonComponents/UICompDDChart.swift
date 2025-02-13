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
    
    @State var displayBWDots: Bool = true
    @State var displayBWAvg2d: Bool = true
    @State var displayBWAvg3d: Bool = true
    @State var displayCalories: Bool = true
    
    var body: some View {
        ZStack {
            DailyChart(dataToDisplay: appController.lesson3ChartData,
                       displayBWDots: displayBWDots,
                       displayBWAvg2d: displayBWAvg2d,
                       displayBWAvg3d: displayBWAvg3d, 
                       displayCalories: displayCalories)
        }.onAppear{ setupChart() }
    }
    
    func setupChart() {
        switch uiData.uiText {
        case "dotsOnly":
            displayBWAvg2d = false
            displayBWAvg3d = false
            displayCalories = false
            
        case "dots&2dmaOnly":
            displayBWAvg3d = false
            displayCalories = false
            
        case "dots&2dmaCal":
            displayBWAvg3d = false
       default: print("ERROR: UICompDDChart, setupChart()  uiData.uiText : \(uiData.uiText)")
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        
        let uiData = UIData(uiText: "dots&2dmaCal",
                            uiText2: "xx",
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
