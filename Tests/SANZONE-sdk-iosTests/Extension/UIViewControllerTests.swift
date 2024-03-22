//
//  UIViewControllerTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest

class UIViewControllerExtensionTests: XCTestCase {

    func testConfigureNavigationBar() {
        // Arrange
        let viewController = UIViewController()
        let expectedTextColor = UIColor.red

        // Act
        viewController.configureNavigationBar(textColor: expectedTextColor)

        // Assert
        XCTAssertEqual(viewController.navigationItem.standardAppearance?.titleTextAttributes[.foregroundColor] as? UIColor, expectedTextColor)
        XCTAssertEqual(viewController.navigationItem.standardAppearance?.largeTitleTextAttributes[.foregroundColor] as? UIColor, expectedTextColor)
        XCTAssertEqual(viewController.navigationItem.scrollEdgeAppearance?.titleTextAttributes[.foregroundColor] as? UIColor, expectedTextColor)
        XCTAssertEqual(viewController.navigationItem.scrollEdgeAppearance?.largeTitleTextAttributes[.foregroundColor] as? UIColor, expectedTextColor)
        XCTAssertNil(viewController.navigationItem.standardAppearance?.backgroundEffect)
        XCTAssertNil(viewController.navigationItem.scrollEdgeAppearance?.backgroundEffect)
    }

    // Add more tests as needed
}
