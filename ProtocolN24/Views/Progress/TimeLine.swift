//
//  TimeView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 30/06/2024.
//

import SwiftData
import SwiftUI

struct TimeLine: View {
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    let deviceWidth = UIScreen.main.bounds.width * 0.8
    let sections: CGFloat = 8
    
    var offsetter: CGFloat {
        return -deviceWidth * 0.475
    }
    
    var increment: CGFloat {
        return deviceWidth / (sections - 1) * 0.95              //* 0.1055
    }
                             // Week    // Index
    var depender = [true,   // 1       // 0
                    true,    // 2       // 1
                    true,    // 3       // 2
                    true,    // 4       // 3
                    true,    // 5       // 4
                    true,    // 6       // 5
                    false,    // 7       // 6
                    false,   // 8       // 7
                    false,   // 9       // 8
                    false ]  // 10      // 9
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke(.blue, lineWidth: 2)
                .frame(width: deviceWidth, height: 12)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .frame(width: deviceWidth, height: 10)
               
            ForEach((1...Int(sections-1)), id: \.self) {
                Circle()
                    .stroke(.blue, lineWidth: 2)
                    .frame(width: 24)
                    .offset(x: offsetter + CGFloat($0) * increment)
                
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 22)
                    .offset(x: offsetter + CGFloat($0) * increment)
                
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: increment, height: 12)
                    .opacity(depender[$0] ? 1 : 0)
                    .offset(x: offsetter - increment * 0.5 + CGFloat($0) * increment)
            }
            
            ForEach((1...Int(sections-2)), id: \.self) {
                Circle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 24)
                    .offset(x: offsetter + CGFloat($0) * increment)
                    .opacity(depender[$0] ? 1 : 0)
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .frame(width: increment, height: 10)
                    .opacity(depender[$0] ? 0 : 1)
                    .offset(x: offsetter + CGFloat($0) * increment)
            }

            // Week 1
            Circle()
                .foregroundColor(.blue)
                .frame(width: 24)
                .offset(x: offsetter)
            
            // Last Week
            Circle()
                .foregroundColor(.blue)
                .frame(width: 24)
                .offset(x: offsetter + (sections - 1) * increment)
                .opacity(depender[Int(sections-1)] ? 1 : 0)
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .frame(width: increment, height: 10)
                .opacity(depender[Int(sections - 1)] ? 0 : 1)
                .offset(x: offsetter + (sections - 1) * increment - 0.25 * increment)
        }//.padding(.trailing)
            //.padding(.leading)
    }
}

#Preview {
    TrackingView()
        .environmentObject(AppController())
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
