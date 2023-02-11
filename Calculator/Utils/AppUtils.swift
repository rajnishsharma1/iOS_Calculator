//
//  AppUtils.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

class AppUtils {
    private func allNumsToDouble(exp: String) -> String {
          let symbolsCharSet = ".,"
          let fullCharSet = "0123456789" + symbolsCharSet
          var i = 0
          var result = ""
          let chars: [Character] = Array(exp);
          while i < chars.count {
              if fullCharSet.contains(chars[i]) {
                  var numString = String(chars[i])
                  i += 1
                  loop: while i < chars.count {
                      if fullCharSet.contains(chars[i]) {
                          numString += String(chars[i])
                          i += 1
                      } else {
                          break loop
                      }
                  }
                  let num: Double? = Double(numString);
                  if num != nil {
                      result += "\(num!)"
                  } else {
                      result += numString
                  }
              } else {
                  result += String(chars[i])
                  i += 1
              }
          }
          return result
      }

    func calculate(expression: String) -> String {
        let transformedString = allNumsToDouble(exp: expression)
        let expr = NSExpression(format: transformedString)
        let result = expr.expressionValue(with: nil, context: nil) as! Double
        return String(format: "%g", result)
    }
    
    func getLastOperand(expression: String) -> String {
        let expression = Array(expression)
        let supportedOperators = "+-*%/"
        var result = ""
        var i = expression.count - 1
        while (i >= 0) {
          if supportedOperators.contains(String(expression[i])) {
            return result
          } else {
            result += String(expression[i])
          }
          i -= 1
        }
        return result
      }
}
