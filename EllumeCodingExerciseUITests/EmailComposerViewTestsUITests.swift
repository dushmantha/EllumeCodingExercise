//
//  EmailComposerViewTestsUITests.swift
//  EllumeCodingExerciseUITests
//
//  Created by Tharaka Dushmantha on 4/04/22.
//

import XCTest

class EmailComposerViewTestsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmailComposerLaunch() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tablesQuery = XCUIApplication().tables
        tablesQuery.cells["art"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        tablesQuery.cells["Art quote of the day , True art is characterized, Author: Albert Einstein, Send e-mail"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
    }
}
