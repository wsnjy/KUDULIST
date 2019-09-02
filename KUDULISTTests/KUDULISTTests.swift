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
        
        let list = List(id: 0, toDo: "1", isDone: false)
        presenter?.lists = [list]
    }

    func testNumberOfListWhenNewListIsNotEmpty() {
        // Arrange
        let expected = (presenter?.lists.count)! + 1
        
        // Act
        presenter?.receiveNewList("2")
        
        // Assert
        XCTAssertEqual(view?.tableView.numberOfRows(inSection: 0), expected)
    }
    
    func testNumberOfListWhenNewListIsEmpty() {
        // Arrange
        let expected = (presenter?.lists.count)! + 1
        
        // Act
        presenter?.receiveNewList("")

        // Assert
        XCTAssertNotEqual(view?.tableView.numberOfRows(inSection: 0), expected)

    }
    
    func testNewValueIsDoneWhenListChecked() {
        // Arrange
        let expected = true
        
        // Act
        _ = presenter?.modifyList(0)
        
        // Assert
        XCTAssertEqual(presenter?.lists[0].isDone, expected)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
