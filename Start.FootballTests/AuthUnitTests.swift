//
//  AuthUnitTests.swift
//  Start.FootballTests
//
//  Created by Vitalii Sosin on 27.01.2021.
//

import XCTest
@testable import Start_Football

class AuthUnitTests: XCTestCase {
    
    
    var fieldValidator: AuthInteractor!
    
    override func setUpWithError() throws {
        fieldValidator = AuthInteractorImpl()
    }
    
    override func tearDownWithError() throws {
        fieldValidator = nil
    }
    
    func testLoginCorrectWithValues() throws {
        let login = "Ivan"
        let expectedResult = true
        var validateResult: Bool
        
        validateResult = fieldValidator.verificationLogin(state: .constant(login))
        XCTAssertEqual(expectedResult, validateResult)
    }
    
    func testLoginCorrectWithEmptyValues() throws {
        let login = ""
        let expectedResult = false
        var validateResult: Bool
        
        validateResult = fieldValidator.verificationLogin(state: .constant(login))
        XCTAssertEqual(expectedResult, validateResult)
    }
}
