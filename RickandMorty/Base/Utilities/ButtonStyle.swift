//
//  ButtonStyle.swift
//  RickAndMorty
//
//  Created by BERKAN NALBANT on 23.04.2023.
//

import Foundation
import SwiftUI

struct CombinedButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? CustomColor.myColor : Color.blue)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct CustomColor {
    static let myColor = Color("LaunchScreenColour")
    // Add more here...
}
