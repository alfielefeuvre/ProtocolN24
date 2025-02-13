//
//  ButtonStandard.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 15/05/2024.
//

import SwiftUI

struct ButtonStandard: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}
