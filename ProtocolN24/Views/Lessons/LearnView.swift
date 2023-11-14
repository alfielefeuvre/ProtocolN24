//
//  LearnView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 14/11/2023.
//

import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Week 1") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            NavigationLink { Lesson1() } label: { Lesson1Card() }
                            NavigationLink { Lesson2() } label: { Lesson2Card() }
                           
                            
                            
                        }
                    }
                    .frame(height: 150)
                }
            }.navigationTitle("Lessons")
        }
    }
}

#Preview {
    LearnView()
}
