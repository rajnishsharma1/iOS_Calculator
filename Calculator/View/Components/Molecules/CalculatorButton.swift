//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

struct ButtonPad: View {
    let buttons: [[ButtonEnum]];
    
    /// Callback to recieve button text value
    let onButtonTap: ((ButtonEnum) -> Void)
    
    @EnvironmentObject private var viewModel: CalculatorViewModel
    
    var body: some View{
        ForEach(buttons, id: \.self) {
            row in HStack {
                ForEach(row, id: \.self) {
                    button in ButtonItem(foregroundColor: foregroundColor(buttonEnum: button),
                                         backgroundColor: getBackgroundColor(buttonEnum: button),
                                         buttonText: button.description,
                                         onButtonTap: {onButtonTap(button)
                        }).padding(.bottom, UIConstants.bottomsVerticalPadding)
                }
            }.padding(.horizontal, UIConstants.bottomsHorizontalPadding)
        }
    }
    
    /// Setting button color
    private func getBackgroundColor(buttonEnum: ButtonEnum) -> Color{
        switch buttonEnum {
        case .one, .two, .four, .five, .seven, .eight, .nine, .six, .three, .zero, .dot, .clear:
            return Color(.lightGray)
        case .equal:
            return Color(.blue)
        default:
            return .lightBlue
        }
    }
  
    /// Setting text color
    private func foregroundColor(buttonEnum: ButtonEnum) -> Color {
        switch buttonEnum {
        case .one, .two, .four, .five, .seven, .eight, .nine, .six, .three, .zero, .dot, .clear:
            return Color(.black)
        case .equal:
            return Color(.white)
        default:
            return Color(.blue)
        }
    }
}
