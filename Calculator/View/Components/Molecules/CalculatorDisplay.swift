//
//  CalculatorDisplay.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

struct CalculatorDisplay: View {
    var displayText: String
    var body: some View {
        HStack {
            Spacer()
            Text(displayText)
                .foregroundColor(.black)
                .font(.system(size: UIConstants.displayFontSize))
        }
    }
}
