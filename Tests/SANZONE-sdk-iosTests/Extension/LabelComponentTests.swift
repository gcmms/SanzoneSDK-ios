//
//  LabelComponentTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest

@testable import SanzoneSDK

class UILabelExtensionTests: XCTestCase {

    func testInitWithSizeAndWeight() {
        // Arrange
        let expectedText = "Test Text"
        let expectedSize: CGFloat = 16.0
        let expectedWeight: UIFont.Weight = .bold

        // Act
        let label = UILabel(
            text: expectedText,
            size: expectedSize,
            weight: expectedWeight
        )

        label.text = expectedText

        label.font = UIFont.systemFont(
            ofSize: expectedSize,
            weight: expectedWeight
        )

        // Assert
        XCTAssertEqual(label.text, expectedText)
        XCTAssertEqual(label.font.pointSize, expectedSize)
        XCTAssertEqual(label.numberOfLines, 0)
    }

    func testInitWithDefaultText() {
        // Arrange
        let expectedText = "Default Text"

        // Act
        let label = LabelComponent()
        label.text = expectedText

        // Assert
        XCTAssertEqual(label.text, expectedText)
        XCTAssertEqual(label.numberOfLines, 1)
    }

    func testFontWithTypeAndSize() {
        // Arrange
        let label = LabelComponent()
        let expectedType = UILabelType.bold
        let expectedSize: CGFloat = 20.0

        // Act
        label.font(type: expectedType, size: expectedSize)

        // Assert
        XCTAssertEqual(
            label.font.fontName,
            expectedType.rawValue
        )
        XCTAssertEqual(label.font.pointSize, expectedSize)
    }

    // Add more tests as needed
}
