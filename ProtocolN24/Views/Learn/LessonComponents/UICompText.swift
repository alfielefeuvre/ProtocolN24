//
//  UICompTextView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI
import SwiftData

struct UICompText: View {
    @Environment(\.modelContext) private var modelContext
    @Query var userConfig: [UserConfig]
    
    var uiData: UIData
    var lessonId: Int
    
    var body: some View {
        ZStack {
            if uiData.uiText.prefix(2) == "xx" {
                Text("Error: UICompTextView = xx")
            } else {
                Text(uiData.uiText).padding()
            }
        }
    }
}

#Preview {
    let uiData = UIData(uiText: """
                                                                            ProtocolN24 has two settings: 'Fat Loss' and 'Muscle Gain'.
                                                                            
                                                                            Our first task is to decide which one of these targets is best for you.
                                                                            
                                                                            For some people this will be an obvious decision, for those people, scroll down to the bottom of this page, make your selection and move on.
                                                                            
                                                                            For those that are unsure or if you would like both 'Fat Loss' and 'Muscle Gain', here are some things you should know before you chose a setting:
                                                                            
                                                                            The majority of people that select 'Fat Loss' will also gain some strength (4% on average).
                                                                            
                                                                            The majority of people who select 'Muscle Gain' will not lose any fat.
                                                                            
                                                                            Would you be happy gaining a little body fat over the next 4 or 5 months? If this is ok, select 'Muscle Gain'.
                                                                            
                                                                            If you would like both 'Muscle Gain' and 'Fat Loss', select 'Fat Loss' and trim down to a weight you are happy with, then we'll transition to 'Muscle Gain'
                                                                            
                                                                            Still undecided? Choose 'Fat Loss'.
                                                                            
                                                                            """, 
                        uiText2: "12 kg",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1, 
                        imageRatio: 0, 
                        uiSegPickerOptions: ["xx"])
    return UICompText(uiData: uiData, lessonId: 20)
        .modelContainer(for: [WeighWeek.self, UserConfig.self])
}
