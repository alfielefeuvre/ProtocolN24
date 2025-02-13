//
//  BusStopView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 01/07/2024.
//

import SwiftUI

struct BusStopView: View {
    let trackLength = UIScreen.main.bounds.width * 0.8

    var offSet: CGFloat {
        return trackLength * -0.5 //-0.475
    }

    let stops: Int
    let stopsPassed: Int

    var increment: CGFloat {
        return trackLength / CGFloat(stops-1)
    }
    
                                 // Week    // Index
    @State var stopStatus = [false,   // 1       // 0
                      false,    // 2       // 1
                      false,    // 3       // 2
                      false,    // 4       // 3
                      false,    // 5       // 4
                      false,    // 6       // 5
                      false,    // 7       // 6
                      false,    // 8       // 7
                      false,    // 9       // 8
                      false,    // 10      // 9
                      false,    // 11      // 10
                      false,    // 12      // 11
                      false]

    let backgroundStrength = 0.2
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(.blue, lineWidth: 2)
                .frame(width: trackLength, height: 12)
            
            if stops > 0 {
                ForEach((0...Int(stops-1)), id: \.self) {
                    Circle()
                        .stroke(.blue, lineWidth: 2)
                        .frame(width: 24)
                        .offset(x: offSet + CGFloat($0) * increment)
                    
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: 22)
                        .offset(x: offSet + CGFloat($0) * increment)
                    
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 22)
                        .offset(x: offSet + CGFloat($0) * increment)
                        .opacity(backgroundStrength)
                }
            }
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .frame(width: trackLength, height: 11)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
                .frame(width: trackLength, height: 11)
                .opacity(backgroundStrength)
            
            // Progress Indicator
            if stopsPassed > 0 {
                ForEach((0...stopsPassed-1), id: \.self) {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 24)
                        .offset(x: offSet + CGFloat($0) * increment)
                        .opacity(stopStatus[$0] ? 1 : 0)

                    if $0 > 0 {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.blue)
                            .frame(width: increment * 0.95, height: 11)
                            .offset(x: offSet + CGFloat($0) * increment - increment * 0.5)
                            .opacity(stopStatus[$0] ? 1 : 0)
                    }
                }
            }
        }.onAppear{ updateStopStatus() }
        .padding()
    }
    
    func updateStopStatus() {
        let count = 0...stops-1
        for number in count {
            if stopsPassed >= number {
                stopStatus[number] = true
            }
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return TrackingView()
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
