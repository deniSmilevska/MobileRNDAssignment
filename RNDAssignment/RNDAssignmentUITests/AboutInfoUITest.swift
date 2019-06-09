//
//  AboutInfoUITest.swift
//  RNDAssignmentUITests
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import XCTest

class AboutInfoUITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCellsInfo(){
        let app = XCUIApplication()
        app.buttons["Show Info"].tap()
        let nameCell = app.tables.staticTexts["Backbase"]
        XCTAssertTrue(nameCell.exists)
        let addressCell = app.tables.staticTexts["Jacob Bontiusplaats 9"]
        XCTAssertTrue(addressCell.exists)
        let postalCodeCell = app.tables.staticTexts["1018 LL"]
        XCTAssertTrue(postalCodeCell.exists)
        let cityCell = app.tables.staticTexts["Amsterdam"]
        XCTAssertTrue(cityCell.exists)
        let detailsCell = app.tables.staticTexts["This is the Backbase iOS assignment"]
        XCTAssertTrue(detailsCell.exists)
        
    }
}
