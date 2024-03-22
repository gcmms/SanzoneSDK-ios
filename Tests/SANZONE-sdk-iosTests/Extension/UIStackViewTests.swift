//
//  UIStackViewTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest

class UIStackViewExtensionTests: XCTestCase {

    func testInitWithAxis() {
        // Arrange
        let expectedAxis: NSLayoutConstraint.Axis = .horizontal

        // Act
        let stackView = UIStackView(axis: expectedAxis)

        // Assert
        XCTAssertEqual(stackView.axis, expectedAxis)
        XCTAssertEqual(stackView.spacing, 0)
    }

    func testInitWithAxisAndSpacing() {
        // Arrange
        let expectedAxis: NSLayoutConstraint.Axis = .vertical
        let expectedSpacing: CGFloat = 10.0

        // Act
        let stackView = UIStackView(axis: expectedAxis, spacing: expectedSpacing)

        // Assert
        XCTAssertEqual(stackView.axis, expectedAxis)
        XCTAssertEqual(stackView.spacing, expectedSpacing)
    }

    func testSetCustomSpacing() {
        // Arrange
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        let expectedSpacing: CGFloat = 20.0

        // Act
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.setCustomSpacing(expectedSpacing, before: view2)

        // Assert
        XCTAssertEqual(stackView.customSpacing(after: view1), expectedSpacing)
    }

    func testAddArrangedSubviews() {
        // Arrange
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()

        // Act
        stackView.addArrangedSubviews([view1, view2, view3])

        // Assert
        XCTAssertEqual(stackView.arrangedSubviews.count, 3)
        XCTAssertTrue(stackView.arrangedSubviews.contains(view1))
        XCTAssertTrue(stackView.arrangedSubviews.contains(view2))
        XCTAssertTrue(stackView.arrangedSubviews.contains(view3))
    }

    func testRemoveArrangedSubviews() {
        // Arrange
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        stackView.addArrangedSubviews([view1, view2, view3])

        // Act
        stackView.removeArrangedSubviews([view1, view3])

        // Assert
        XCTAssertEqual(stackView.arrangedSubviews.count, 1)
        XCTAssertFalse(stackView.arrangedSubviews.contains(view1))
        XCTAssertTrue(stackView.arrangedSubviews.contains(view2))
        XCTAssertFalse(stackView.arrangedSubviews.contains(view3))
    }

    func testRemoveAllArrangedSubviews() {
        // Arrange
        let stackView = UIStackView()
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        stackView.addArrangedSubviews([view1, view2, view3])

        // Act
        stackView.removeAllArrangedSubviews()

        // Assert
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
    }
}
