//
//  UICompHeader.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI

struct UICompHeader: View {
    var uiData: UIData
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    
    var body: some View {
        ZStack {
            Image(uiData.uiImage)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
                .opacity(0.7)
            
            VStack {
                Text(uiData.uiText)
                    .font(.largeTitle)
                    .padding()
                
                Text(uiData.uiText2)
                    .font(.title2)
                
                Spacer()
            }
        }.frame(width: uiData.ratioOfDeviceWidth * deviceWidth ,
                height: uiData.ratioOfDeviceWidth * deviceWidth * uiData.imageRatio)
        .padding()
    }
}

#Preview {
    let uiData = UIData(uiText: "Header",
                        uiText2: "Sub Header",
                        uiImage: "Gym",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0.6, 
                        uiSegPickerOptions: ["xx"])
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    return UICompHeader(uiData: uiData)
}
