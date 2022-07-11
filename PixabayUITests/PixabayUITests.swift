//
//  PixabayUITests.swift
//  PixabayUITests
//
//  Created by Manish on 04/07/22.
//

import XCTest

class PixabayUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_search_successfully() throws {
     
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["searchText"]
        searchTextField.tap()
        searchTextField.typeText("Tiger")
        app.buttons["searchButton"].tap()
        app.navigationBars["Picture"].buttons["Back"].tap()
    }

    func test_search_Error(){
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["searchText"]
        searchTextField.tap()
        searchTextField.typeText("")
        app.buttons["searchButton"].tap()
      
                                        
    }
    

}
