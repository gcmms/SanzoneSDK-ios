//
//  CollectionTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 22/03/24.
//

import Foundation
import XCTest

class CollectionExtensionTests: XCTestCase {

    func testSafeSubscript() {
        // Arrange
        let array = [1, 2, 3, 4, 5]

        // Act & Assert
        XCTAssertEqual(array[safe: 0], 1)
        XCTAssertEqual(array[safe: 2], 3)
        XCTAssertEqual(array[safe: 4], 5)
        XCTAssertNil(array[safe: -1])
        XCTAssertNil(array[safe: 5])

        XCTAssertEqual(array[safe: 0, default: -1], 1)
        XCTAssertEqual(array[safe: 2, default: -1], 3)
        XCTAssertEqual(array[safe: 4, default: -1], 5)
        XCTAssertEqual(array[safe: -1, default: -1], -1)
        XCTAssertEqual(array[safe: 5, default: -1], -1)
    }

    func testRemoveAtIndex() {
        // Arrange
        var array = [1, 2, 3, 4, 5]

        // Act & Assert
        XCTAssertEqual(array.remove(index: 0), 1)
        XCTAssertEqual(array, [2, 3, 4, 5])

        XCTAssertEqual(array.remove(index: 2), 4)
        XCTAssertEqual(array, [2, 3, 5])

        XCTAssertNil(array.remove(index: -1))
        XCTAssertNil(array.remove(index: 3))
        XCTAssertEqual(array, [2, 3, 5])
    }
}
