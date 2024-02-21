//
//  Autolayout_Vertical_Bar_GraphUITestsLaunchTests.swift
//  Autolayout_Vertical_Bar_GraphUITests
//
//  Created by jhlee on 2023/09/13.
//

import XCTest

final class Autolayout_Vertical_Bar_GraphUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
