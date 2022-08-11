//
//  Sun_3_july_2022_AssignmentUITestsLaunchTests.swift
//  Sun 3 july 2022 AssignmentUITests
//
//  Created by Prince's Mac on 03/07/22.
//

import XCTest

class Sun_3_july_2022_AssignmentUITestsLaunchTests: XCTestCase {

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
