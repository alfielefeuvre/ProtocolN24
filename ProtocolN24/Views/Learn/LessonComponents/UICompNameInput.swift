//
//  UICompNameInput.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 13/08/2024.
//

import SwiftUI

struct UICompNameInput: View {
    var uiData: UIData
    
    var body: some View {
        VStack {
            Text("Add your name to join the '10 Secrets to Shredded':")
        }
    }
}

#Preview {
do {
    let previewer = try Previewer()
    
    let uiData = UIData(uiText: "dots&2dmaCal",
                        uiText2: "xx",
                        uiImage: "xx",
                        ratioOfDeviceWidth: 1,
                        imageRatio: 0.7,
                        uiSegPickerOptions: ["Not Sure", "Fat Loss", "Muscle Gain"])
    
    return UICompNameInput(uiData: uiData)
        .environmentObject(AppController())
        .modelContainer(previewer.container)
} catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
}
}
