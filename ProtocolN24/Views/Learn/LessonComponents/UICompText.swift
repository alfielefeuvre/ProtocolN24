//
//  UICompTextView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 21/05/2024.
//

import SwiftUI

struct UICompText: View {
    var uiData: UIData
    
    var body: some View {
        if uiData.uiText.prefix(2) == "xx" {
            Text("Error: UICompTextView = xx")
        } else {
            Text(uiData.uiText).padding()
        }
    }
}

#Preview {
    let uiData = UIData(uiText: "Text to be displayed!", 
                        uiText2: "xx",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1, 
                        imageRatio: 0, 
                        uiSegPickerOptions: ["xx"])
    return UICompText(uiData: uiData)
}
