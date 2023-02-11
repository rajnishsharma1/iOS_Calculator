//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CalculatorViewModel())
        }
    }
}
