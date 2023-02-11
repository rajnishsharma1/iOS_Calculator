//
//  ButtonItem.swift
//  Calculator
//
//  Created by Rajnish Sharma on 11/02/23.
//

import SwiftUI
import AVFoundation

struct ButtonItem: View {
    let foregroundColor: Color;
    let backgroundColor: Color;
    let buttonText: String;
    
    /// Callback to recieve button text value
    let onButtonTap: (() -> Void)
    
    var body: some View {
        Button(action: {
            AudioServicesPlaySystemSound(1306)
            onButtonTap()
        }, label: {
            Text(buttonText)
                .font(.system(size: UIConstants.buttonFontSize))
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.1)
                .foregroundColor(foregroundColor)
        }).cornerRadius(UIConstants.buttonCornerRadius).buttonStyle(CustomButtonStyle(backgroundColor: backgroundColor))
    }
}

