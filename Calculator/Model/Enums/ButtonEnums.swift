//
//  ButtonEnums.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

enum ButtonEnum : String{
    
    /// For numericals
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case dot = "."

    /// For clearing the display
    case allClear = "AC"
    case clear = "C"
    
    /// For operators
    case multiply = "*"
    case subtract = "-"
    case addition = "+"
    case equal = "="
    case divide = "/"
    case plusMinus = "±"
    case mod = "/100*"
    
    /// Default case: when nothing is selected
    case none
    
    /// To show in UI
    var description: String {
        switch self {
        case .multiply:
            return "x"
        case .divide:
            return "÷"
        case .mod:
            return "%"
        default:
            return self.rawValue
        }
    }
}
