//
//  KUDULISTUITests.swift
//  KUDULISTUITests
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import XCTest

class KUDULISTUITests: XCTestCase {

    var app = XCUIApplication()

    override func setUp() {
    
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["-uitesting"]

    }

    override func tearDown() {}
    
    func tapAddButton() {
        app.launch()
        app.buttons["icon add"].tap()
    }

    func testAddNewList() {
        
        tapAddButton()
        app.alerts["What to do?"].textFields.firstMatch.typeText("SATU SATU")
        app.alerts["What to do?"].buttons["Add"].tap()
        
        app.buttons["icon add"].tap()
        app.alerts["What to do?"].textFields.firstMatch.typeText("DUAAAA")
        app.alerts["What to do?"].buttons["Add"].tap()
        
        app.buttons["icon add"].tap()
        app.alerts["What to do?"].textFields.firstMatch.typeText("TIGAAAAAA")
        app.alerts["What to do?"].buttons["Add"].tap()


    }
    
    func testAddAlertCancel() {
        tapAddButton()
        app.alerts["What to do?"].textFields.firstMatch.typeText("Empat")
        app.alerts["What to do?"].buttons["Cancel"].tap()
    }

    func testAddEmptyValue() {
        tapAddButton()
        app.alerts["What to do?"].textFields.firstMatch.typeText("")
        app.alerts["What to do?"].buttons["Add"].tap()
    }

    
}
