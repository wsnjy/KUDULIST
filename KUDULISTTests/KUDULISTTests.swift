//
//  KUDULISTTests.swift
//  KUDULISTTests
//
//  Created by wsnjy on 02/09/19.
//  Copyright © 2019 wsnjy. All rights reserved.
//

import XCTest
@testable import KUDULIST

class KUDULISTTests: XCTestCase {

    var presenter:MainPresenter?
    var view:MainController?
    
    override func setUp() {
        view = MainController()
        presenter = MainPresenter()
        presenter?.view = view
    }

    func testNumberOfListWhenNewListIsNotEmpty() {
        // Arrange
        presenter?.lists = ["1"]
        let expected = (presenter?.lists.count)! + 1
        
        // Act
        presenter?.receiveNewList("2")
        
        // Assert
        XCTAssertEqual(view?.tableView.numberOfRows(inSection: 0), expected)
    }
    
    func testNumberOfListWhenNewListIsEmpty() {
        // Arrange
        presenter?.lists = ["1"]
        let expected = (presenter?.lists.count)! + 1
        
        // Act
        presenter?.receiveNewList("")

        // Assert
        XCTAssertNotEqual(view?.tableView.numberOfRows(inSection: 0), expected)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
