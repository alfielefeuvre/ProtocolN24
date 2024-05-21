//
//  UICompImageView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI

struct UICompImage: View {
    var uiData: UIData
    var deviceWidth: CGFloat
    
    var body: some View {
        ZStack {
            if uiData.uiImage.prefix(2) == "xx" {
                Text("Error: UICompTextView = xx")
            } else {
                Image(uiData.uiImage)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .frame(width: uiData.ratioOfDeviceWidth * deviceWidth,
                           height: uiData.ratioOfDeviceWidth * deviceWidth * uiData.imageRatio)
            }
        }.padding()
    }
}

#Preview {
    let uiData = UIData(uiText: "xx", 
                        uiText2: "xx",
                        uiImage: "Gym",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 1, 
                        uiSegPickerOptions: ["xx"],
                        uiQuestion: "xx",
                        uiAnswer: "xx")
    let deviceWidth = UIScreen.main.bounds.width * 0.95
    return UICompImage(uiData: uiData, deviceWidth: deviceWidth)
}

