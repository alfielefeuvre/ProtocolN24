//
//  BusStopTextView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 02/07/2024.
//
import Foundation
import SwiftUI

struct BusStopTextView: View {
    
    let weekIn: Int 
    let startDate: Date
    let endDate: Date
    
    var calendar = Calendar(identifier: .gregorian)
    
    var body: some View {
        HStack {
            VStack {
                Text(Date.getMonth(date: startDate) + ", \(Date.getDay(date: startDate))")
               Text(Date.getYear(date: startDate))
            }
            Spacer()
            Text("Week \(weekIn)").font(.largeTitle)
            Spacer()
            VStack {
                Text(Date.getMonth(date: endDate) + ", \(Date.getDay(date: endDate))")
               Text(Date.getYear(date: endDate))
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
