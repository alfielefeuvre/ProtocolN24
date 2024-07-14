//
//  FoodView.swift
//  ProtocolN24
//
//  Created by Alfie Le Feuvre on 28/06/2024.
//

import Foundation
import SwiftUI

struct FoodView: View {
        
    var body: some View {
        NavigationView {
            List {
                Text("Food View")
                Last14Chart()
                Last28Chart()
            }.navigationTitle("Food & Drink")
        }
    }
}
