//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Rajnish Sharma on 02/02/23.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var viewModel: CalculatorViewModel = CalculatorViewModel()
    override func setUpWithError() throws {
        viewModel = CalculatorViewModel()
    }

    override func tearDownWithError() throws {
  
    }

    func testExample() throws {}
    
    func testSuccess() throws {
        viewModel.display = "1+2+3"
        viewModel.registerButtonClick(argument: ButtonEnum.equal)
        
        let result = AppUtils().calculate(expression: viewModel.display)
        XCTAssertEqual(result, "6")
    }
    
    func testFailure() throws {
        viewModel.display = "1+2+3"
        viewModel.registerButtonClick(argument: ButtonEnum.equal)
        
        let result = AppUtils().calculate(expression: viewModel.display)
        XCTAssertEqual(result, "9")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
