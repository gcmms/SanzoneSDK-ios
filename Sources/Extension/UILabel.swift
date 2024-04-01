//
//  UILabel.swift
//  SanzoneSDK
//
//  Criado por Gabriel Chirico Mahtuk de Melo Sanzone em 27/03/23.
//

import UIKit

/// Extensão que adiciona inicializadores e métodos convenientes à classe UILabel.
public extension UILabel {

    /// Inicializa uma instância de LabelComponent com texto, tamanho da fonte e peso da fonte especificados.
    ///
    /// - Parameters:
    ///   - text: O texto a ser exibido no rótulo.
    ///   - size: O tamanho da fonte do rótulo.
    ///   - weight: O peso da fonte do rótulo.
    convenience init(text: String = "", size: CGFloat, weight: UIFont.Weight) {
        self.init()
        self.text = text
        font = UIFont.systemFont(ofSize: size, weight: weight)
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }

    /// Inicializa uma instância de LabelComponent com texto especificado.
    ///
    /// - Parameter text: O texto a ser exibido no rótulo.
    convenience init(text: String = "") {
        self.init()
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }

    /// Define a fonte do rótulo com um tipo e tamanho específicos.
    ///
    /// - Parameters:
    ///   - type: O tipo de fonte a ser definido.
    ///   - size: O tamanho da fonte a ser definido.
    func font(type: UILabelType, size: CGFloat) {
        font = UIFont(name: type.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}

/// Enumeração que representa os tipos de fonte disponíveis para o rótulo.
public enum UILabelType: String {
    case bold = "HelveticaNeue-Bold"
    case medium = "HelveticaNeue-Medium"
}
