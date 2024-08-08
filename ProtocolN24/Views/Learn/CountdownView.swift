//
//  CountdownView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 06/08/2024.
//

import SwiftUI

struct CountdownView: View {
    @EnvironmentObject var appController: AppController
    
    @State var timeRemaining = 10
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var days: Int = 0
    @State private var hours: Int = 0
    @State private var mins: Int = 0
    @State private var secs: Int = 0
    
    var body: some View {
        LazyVStack {
           Text("10 Secrets to Shredded:")
            HStack {
                VStack {
                    Text("\(days)").font(.largeTitle)
                    Text("DAYS")
                }
                Text(":").font(.system(size: 32, weight: .bold))
                
                VStack {
                    Text("\(hours)").font(.largeTitle)
                    Text("HOURS")
                }
                Text(":").font(.system(size: 32, weight: .bold))
                
                VStack {
                    Text("\(mins)").font(.largeTitle)
                    Text("MINS")
                }
                Text(":").font(.system(size: 32, weight: .bold))
                
                VStack {
                    Text("\(secs)").font(.largeTitle)
                    Text("SECS")
                }
            }
            .onReceive(timer) { _ in
                    let timeValue = calendar.dateComponents([.day, .hour, .minute, .second], from: .now, to: appController.next14DCStarts)
                    days = timeValue.day ?? 0
                    hours = timeValue.hour ?? 0
                    mins = timeValue.minute ?? 0
                    secs = timeValue.second ?? 0
            }
        }.onAppear{ timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() }
        .onDisappear { timer.upstream.connect().cancel() }
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        let lesson010 = Lesson010().lesson010
        let lesson020 = Lesson020().lesson020
        let lesson030 = Lesson030().lesson030
        let lesson040 = Lesson040().lesson040
        let lesson050 = Lesson050().lesson050
        let lesson060 = Lesson060().lesson060
        let lesson070 = Lesson070().lesson070
        let lesson080 = Lesson080().lesson080
        let lesson090 = Lesson090().lesson090
        let lesson100 = Lesson100().lesson100
        let lesson110 = Lesson110().lesson110
        let lesson120 = Lesson120().lesson120
        let lessons = [lesson010, lesson020, lesson030,
                       lesson040, lesson050, lesson060,
                       lesson070, lesson080, lesson090,
                       lesson100, lesson110, lesson120]
        
        return LearnView(lessons: lessons)
            .environmentObject(AppController())
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
