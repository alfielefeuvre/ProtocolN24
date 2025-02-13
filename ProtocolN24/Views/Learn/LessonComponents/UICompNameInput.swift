//
//  UICompNameInput.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 13/08/2024.
//

import SwiftUI

struct UICompNameInput: View {
    var uiData: UIData
    @State private var knownName = " "

    var body: some View {
        VStack {
            Text("Known name:")
            TextField("Amount", text: $knownName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
            Button("") { addName() }
        }
    }
    
    func addName() {
        
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
