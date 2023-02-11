//
//  ViewController.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    /// Final 2-D array for buttons
    let buttons: [[ButtonEnum]] = [
        [.allClear, .plusMinus, .mod, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .addition],
        [.one, .two, .three, .subtract],
        [.zero, .dot, .clear, .equal]
    ]
    
    /// Variable to display output/initial value on the primary screen
    @Published var display: String = ButtonEnum.zero.rawValue
    /// Variable to display output/initial value on the secondary screen
    @Published var secondaryDisplay: String = ""

    /// To avoid 2 operators after a number
    var hasOperatorAtLast: Bool = false
    
    func registerButtonClick(argument buttonEnum :ButtonEnum) {
        switch buttonEnum {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            if (self.display != ButtonEnum.zero.rawValue) {
                self.display = self.display + buttonEnum.rawValue
            } else {
                self.display = buttonEnum.rawValue
            }
            hasOperatorAtLast = false
        case .multiply, .subtract, .addition, .divide, .mod:
            if (!hasOperatorAtLast) {
                self.display = self.display + buttonEnum.rawValue
            } else {
                dropLastOperator()
                self.display = self.display + buttonEnum.rawValue
            }
            hasOperatorAtLast = true
        case .zero:
            if (self.display != ButtonEnum.zero.rawValue) {
                self.display = self.display + ButtonEnum.zero.rawValue
            } else {
                self.display = ButtonEnum.zero.rawValue
            }
            hasOperatorAtLast = false
        case .dot:
            let lastOperand = AppUtils().getLastOperand(expression: self.display)
            if (lastOperand.contains(ButtonEnum.dot.rawValue)) {
                return
            }
            self.display = self.display + ButtonEnum.dot.rawValue
        case .allClear:
            self.display = ButtonEnum.zero.rawValue
            self.secondaryDisplay = ""
            hasOperatorAtLast = false
        case .clear:
            if (self.display.contains(ButtonEnum.addition.rawValue) ||
                self.display.contains(ButtonEnum.subtract.rawValue) ||
                self.display.contains(ButtonEnum.divide.rawValue) ||
                self.display.contains(ButtonEnum.multiply.rawValue) ||
                self.display == ButtonEnum.zero.rawValue) {
                self.secondaryDisplay = ""
            } else {
                self.secondaryDisplay = Strings.answer + self.display
            }
            self.display = ButtonEnum.zero.rawValue
            hasOperatorAtLast = false
        case .equal:
            equalTap()
        case .plusMinus:
            togglePlusMinusTap()
        default:
            self.display = ButtonEnum.zero.rawValue
        }
    }
    
    /// Toggle plus minus
    private func togglePlusMinusTap() {
        if  (self.display[display.startIndex] == "-") {
            self.display = String(self.display.dropFirst())
        } else {
            if (self.display != ButtonEnum.zero.rawValue) {
                self.display =  "-" + self.display
            }
        }
    }
    
    /// On equal tap
    private func equalTap() {
        /// Handling only 0 case
        if self.display == ButtonEnum.zero.rawValue {
            return
        }
        
        /// Handling infinity case
        if self.display.contains(Strings.infinity) {
            self.display = Strings.infinity
            return
        }
        
        /// Handling exponential case
        if self.display.contains("e") {
            self.display = Strings.numberTooBig
            return
        }
        
        /// Handling Number too big case
        if self.display.contains(Strings.numberTooBig) {
            self.display = "0"
            return
        }
        
        /// Handling not a number case
        if self.display.contains(Strings.notANumber) {
            self.display = "0"
            return
        }
        
        dropLastOperator()
        
        /// Setting the expression in secondary display to show result in primary display
        self.secondaryDisplay = self.display + ButtonEnum.equal.rawValue
        self.display = AppUtils().calculate(expression: self.display)
    }

    /// Drop last character if it is any operator or dot
    private func dropLastOperator() {
        let lastChar = String(self.display.last!)
        
        if (lastChar == ButtonEnum.divide.rawValue ||
            lastChar == ButtonEnum.multiply.rawValue ||
            lastChar == ButtonEnum.addition.rawValue ||
            lastChar == ButtonEnum.subtract.rawValue ||
            lastChar == ButtonEnum.dot.rawValue) {
            self.display = String(self.display.dropLast())
        }
    }
}
