//
//  ScreenshotView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 01/07/2024.
//

import SwiftUI

struct ScreenshotView: View {
    let deviceWidth = UIScreen.main.bounds.width * 0.875
    
    var body: some View {
        Section("Screenshot") {
            VStack {
                ZStack {
                    ArcProgressBGView()
                    CircleProgress2View()
                    ArcTextView()
                }
                TimeLine()
                TimeTextLine()
            }.padding()
        }
        
        Section("Stats") {
            HStack {
                Text("Start Weight")
                Spacer()
                Text("87.3 kg")
            }
            
            HStack {
                Text("Current Weight")
                Spacer()
                Text("83.0 kg")
            }
            
            HStack {
                Text("Weight Loss")
                Spacer()
                Text("4.3 kg")
            }
            
            HStack {
                Text("Weight Loss % ")
                Spacer()
                Text("4.9 %")
            }
        }
    }
}





struct CircleProgressView: View {
    let deviceWidth = UIScreen.main.bounds.width * 0.6
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: deviceWidth)
            
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: deviceWidth * 0.85)
            
            
            Rectangle()
                .frame(width: deviceWidth * 0.55, height:  deviceWidth * 0.55)
                .rotationEffect(Angle(degrees: 45))
                .foregroundColor(.orange)
            
            
            
            
        }
    }
    
}

struct CircleProgress2View: View {
    
    @State private var progress = 0.35
    
    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                if progress < 1.0 {
                    withAnimation {
                        progress += 0.2
                    }
                }
            }.rotationEffect(Angle(degrees: 242.5))
    }
    
}




struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 12.0      //25

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}





struct TimeTextLine: View {
    let deviceWidth = UIScreen.main.bounds.width * 0.875
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(" Sep, 20")
                    Text(" 2024")
                }
                Spacer()
                Text("Week 6").font(.largeTitle)
                Spacer()
                VStack {
                    Text("Oct, 15 ")
                    Text("2024 ")
                }
            }//.padding()
        }.frame(width: deviceWidth)
    }
}


#Preview {
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
