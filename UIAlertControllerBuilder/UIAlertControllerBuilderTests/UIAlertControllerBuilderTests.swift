//
//  UIAlertControllerBuilderTests.swift
//  UIAlertControllerBuilderTests
//
//  Created by Niil Öhlin on 2017-06-22.
//  Copyright © 2017 Niil Öhlin. All rights reserved.
//

import XCTest
@testable import UIAlertControllerBuilder

class UIAlertControllerBuilderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let alertController = UIAlertController.alertController { (builder) in
            builder.title = "warning"
            builder.message = "msg"
            builder["ok"] = { action in
                print("ok pressed")
            }
            builder["destroy"][.destructive] = { action in
                print("destroy pressed")
            }
        }
        XCTAssertEqual(alertController.title, "warning")
        XCTAssertEqual(alertController.message, "msg")
        XCTAssertEqual(alertController.actions.count, 2)
        XCTAssertEqual(alertController.actions[0].title, "ok")
        XCTAssertEqual(alertController.actions[1].title, "destroy")

        XCTAssertEqual(alertController.actions[0].style, .default)
        XCTAssertEqual(alertController.actions[1].style, .destructive)
    }
}
