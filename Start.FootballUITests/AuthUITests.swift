//
//  AuthUITests.swift
//  Start.FootballUITests
//
//  Created by Vitalii Sosin on 28.01.2021.
//

import XCTest
@testable import Start_Football

class AuthUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().scrollViews.otherElements.buttons["Зарегистрируйтесь"].tap()
        XCTAssert(XCUIApplication().scrollViews.otherElements.textFields["roman@start.football"].waitForExistence(timeout: 1.0))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
