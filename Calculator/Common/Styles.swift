//
//  Styles.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    let backgroundColor: Color;
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor)
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
