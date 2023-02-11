//
//  ContentView.swift
//  Calculator
//
//  Created by Rajnish Sharma on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    var body: some View {
            VStack() {
                Spacer()
                CalculatorDisplay(displayText: viewModel.secondaryDisplay).padding(.all, UIConstants.displayPadding)
                CalculatorDisplay(displayText: viewModel.display).padding(.all, UIConstants.displayPadding)
                ButtonPad(buttons: viewModel.buttons, onButtonTap: {str in
                    viewModel.registerButtonClick(argument: str)
                })
            }
            .padding(.bottom, UIConstants.bottomBarPadding) // Space from bottom, for the bottom bar
            .ignoresSafeArea(.all) // Remove SafeArea
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
