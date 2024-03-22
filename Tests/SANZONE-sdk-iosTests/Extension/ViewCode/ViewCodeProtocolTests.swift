//
//  ViewCodeProtocolTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import XCTest
@testable import SANZONE_sdk

class ViewCodeProtocolTests: XCTestCase {

    class MockView: UIView, ViewCodeProtocol {
        var didCallAddSubviews = false
        var didCallDefineSubviewConstraints = false
        var didCallConfigureView = false

        func addSubviews() {
            didCallAddSubviews = true
        }

        func defineSubviewConstraints() {
            didCallDefineSubviewConstraints = true
        }

        func configureView() {
            didCallConfigureView = true
        }
    }

    func testSetupViewCodeElement() {
        // Arrange
        let mockView = MockView()

        // Act
        mockView.setupViewCodeElement()

        // Assert
        XCTAssertTrue(mockView.didCallAddSubviews)
        XCTAssertTrue(mockView.didCallDefineSubviewConstraints)
        XCTAssertTrue(mockView.didCallConfigureView)
    }

    /*func testActivateConstraintsWithLowerLayoutPriority() {
        // Arrange
        let constraints = [
            NSLayoutConstraint(),
            NSLayoutConstraint()
        ]

        let mockView = MockView()

        // Act
        mockView.activateConstraintsWithLowerLayoutPriority(constraints)

        // Assert
        for constraint in constraints {
            XCTAssertEqual(constraint.priority, UILayoutPriority(999.0))
            XCTAssertTrue(constraint.isActive)
        }
    }*/
}
