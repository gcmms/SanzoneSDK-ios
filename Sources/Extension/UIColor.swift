//
//  UIColor.swift
//  SanzoneSDK
//
//  Criado por Gabriel Sanzone - Job em 09/09/22.
//

import Foundation
import UIKit

/// Enumeração que representa os valores predefinidos de cores utilizados na aplicação.
public enum ColorValue {
    case primaryColor
    case backgroundColor
    case cardColor
    case buttonColor
    case textFieldBackground
    case labelColor
    case buttonColorError

    var value: String {
        switch self {
        case .primaryColor: return "primaryColor"
        case .backgroundColor: return "backgroundColor"
        case .cardColor: return "cardColor"
        case .buttonColor: return "buttonColor"
        case .textFieldBackground: return "textFieldBackground"
        case .labelColor: return "labelColor"
        case .buttonColorError: return "buttonColorError"
        }
    }
}

/// Extensão que adiciona funcionalidades adicionais à classe UIColor.
public extension UIColor {

    /// Inicializa uma cor a partir de um valor predefinido de cor.
    ///
    /// - Parameter value: O valor predefinido de cor.
    convenience init?(value: ColorValue) {
        self.init(named: value.rawValue)
    }

    /// Inicializa uma cor a partir de um código hexadecimal.
    ///
    /// - Parameter hex: O código hexadecimal representando a cor.
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    /// Inicializa uma cor a partir de um código hexadecimal representado por um inteiro.
    ///
    /// - Parameter hex: O código hexadecimal representado por um inteiro.
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    /// Verifica se a cor é clara.
    ///
    /// - Returns: `true` se a cor for clara, `false` caso contrário.
    func isLight() -> Bool {
        guard let components = cgColor.components,
            components.count >= 3 else { return false }
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return !(brightness < 0.5)
    }

    /// Retorna a cor complementar desta cor.
    var complementaryColor: UIColor {
        if #available(iOS 13, tvOS 13, *) {
            return UIColor { _ in
                return self.isLight() ? self.darker : self.lighter
            }
        } else {
            return isLight() ? darker : lighter
        }
    }

    /// Retorna uma versão mais clara desta cor.
    var lighter: UIColor {
        adjust(by: 1.35)
    }

    /// Retorna uma versão mais escura desta cor.
    var darker: UIColor {
        adjust(by: 0.94)
    }

    /// Ajusta a cor pelo percentual especificado.
    ///
    /// - Parameter percent: O percentual pelo qual a cor será ajustada.
    /// - Returns: A cor ajustada.
    func adjust(by percent: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * percent, alpha: a)
    }

    /// Cria um gradiente de cores com esta cor e sua cor complementar.
    ///
    /// - Returns: Uma matriz de cores representando o gradiente.
    func makeGradient() -> [UIColor] {
        [self, self.complementaryColor, self]
    }
}
