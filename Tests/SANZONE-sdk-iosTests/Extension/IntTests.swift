//
//  IntTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest
import SANZONE_sdk

class IntExtensionTests: XCTestCase {

    func testFormattedString() {
        // Arrange
        let number = 123456

        // Act
        let formattedNumber = number.formattedString(mask: "###,###")

        // Assert
        XCTAssertEqual(formattedNumber, "123,456")
    }

    func testFormattedStringWithDifferentMask() {
        // Arrange
        let number = 9987654321

        // Act
        let formattedNumber = number.formattedString(mask: "##,##,###,###")

        // Assert
        XCTAssertEqual(formattedNumber, "99,87,654,321")
    }

    func testFormattedStringWithEmptyMask() {
        // Arrange
        let number = 1234567890

        // Act
        let formattedNumber = number.formattedString(mask: "")

        // Assert
        XCTAssertEqual(formattedNumber, "")
    }
}
