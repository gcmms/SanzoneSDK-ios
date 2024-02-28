//
//  Collection.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 11/01/24.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return index < endIndex && index >= startIndex ? self[index] : nil
    }

    subscript(safe index: Index, default defaultValue: @autoclosure () -> Element) -> Element {
        return index < endIndex && index >= startIndex ? self[index] : defaultValue()
    }
}

public extension Collection where Self: RangeReplaceableCollection {
    @discardableResult
    mutating func remove(index: Index) -> Element? {
        if indices.contains(index) {
            return remove(at: index)
        }
        return nil
    }
}
