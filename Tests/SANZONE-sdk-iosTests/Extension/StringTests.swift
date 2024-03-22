//
//  StringTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest

class StringExtensionTests: XCTestCase {

    func testTrim() {
        // Arrange
        let string = "  Hello, World!  "

        // Act
        let trimmedString = string.trim()

        // Assert
        XCTAssertEqual(trimmedString, "Hello, World!")
    }

    func testIsValidEmail() {
        // Arrange
        let validEmail = "test@example.com"
        let invalidEmail = "invalidemail"

        // Act & Assert
        XCTAssertTrue(validEmail.isValidEmail)
        XCTAssertFalse(invalidEmail.isValidEmail)
    }

    func testIsValidFirstName() {
        // Arrange
        let validFirstName = "John"
        let invalidFirstName = "J"

        // Act & Assert
        XCTAssertTrue(validFirstName.isValidFirstName)
        XCTAssertFalse(invalidFirstName.isValidFirstName)
    }

    func testIsValidLastName() {
        // Arrange
        let validLastName = "Doe"
        let invalidLastName = "D"

        // Act & Assert
        XCTAssertTrue(validLastName.isValidLastName)
        XCTAssertFalse(invalidLastName.isValidLastName)
    }

    // Add more tests for other methods as needed
}
