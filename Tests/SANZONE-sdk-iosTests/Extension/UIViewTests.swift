//
//  UIViewTests.swift
//  
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest

class UIViewExtensionTests: XCTestCase {

    func testInitWithBackgroundColor() {
        // Arrange
        let expectedBackgroundColor = UIColor.red

        // Act
        let view = UIView(backgroud: expectedBackgroundColor)

        // Assert
        XCTAssertEqual(view.backgroundColor, expectedBackgroundColor)
    }

    func testSetupShadow() {
        // Arrange
        let view = UIView()
        let expectedShadowColor = UIColor.black.cgColor
        let expectedShadowOpacity: Float = 0.2
        let expectedShadowOffset = CGSize(width: 2, height: 2)
        let expectedShadowRadius: CGFloat = 4

        // Act
        view.setupShadow(
            shadowColor: expectedShadowColor,
            shadowOpacity: expectedShadowOpacity,
            shadowOffset: expectedShadowOffset,
            shadowRadius: expectedShadowRadius
        )

        // Assert
        XCTAssertEqual(view.layer.shadowColor, expectedShadowColor)
        XCTAssertEqual(view.layer.shadowOpacity, expectedShadowOpacity)
        XCTAssertEqual(view.layer.shadowOffset, expectedShadowOffset)
        XCTAssertEqual(view.layer.shadowRadius, expectedShadowRadius)
        XCTAssertFalse(view.layer.masksToBounds)
    }

    func testSetRadius() {
        // Arrange
        let view = UIView()
        let expectedRadius: CGFloat = 10.0

        // Act
        view.setRadius(radius: expectedRadius)

        // Assert
        XCTAssertEqual(view.layer.cornerRadius, expectedRadius)
        XCTAssertTrue(view.layer.masksToBounds)
    }

    // Add more tests as needed
}
