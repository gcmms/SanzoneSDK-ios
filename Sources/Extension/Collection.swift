//
//  Collection.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 11/01/24.
//

import Foundation

/// Uma extensão que fornece funcionalidades adicionais para coleções.
public extension Collection {

    /// Retorna o elemento no índice especificado de forma segura.
    ///
    /// - Parameter index: O índice do elemento a ser acessado.
    /// - Returns: O elemento na posição do índice especificado, ou `nil` se o índice estiver fora dos limites da coleção.
    subscript(safe index: Index) -> Element? {
        return index < endIndex && index >= startIndex ? self[index] : nil
    }

    /// Retorna o elemento no índice especificado de forma segura, com um valor padrão alternativo.
    ///
    /// - Parameters:
    ///   - index: O índice do elemento a ser acessado.
    ///   - defaultValue: O valor padrão a ser retornado caso o índice esteja fora dos limites da coleção.
    /// - Returns: O elemento na posição do índice especificado, ou o valor padrão alternativo se o índice estiver fora dos limites da coleção.
    subscript(safe index: Index, default defaultValue: @autoclosure () -> Element) -> Element {
        return index < endIndex && index >= startIndex ? self[index] : defaultValue()
    }
}

public extension Collection where Self: RangeReplaceableCollection {
    
    /// Remove o elemento na posição do índice especificado, se existir.
    ///
    /// - Parameter index: O índice do elemento a ser removido.
    /// - Returns: O elemento removido, ou `nil` se o índice estiver fora dos limites da coleção.
    @discardableResult
    mutating func remove(index: Index) -> Element? {
        if indices.contains(index) {
            return remove(at: index)
        }
        return nil
    }
}
