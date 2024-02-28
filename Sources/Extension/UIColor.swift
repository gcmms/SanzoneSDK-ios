//
//  UIColor.swift
//  SanzoneSDK
//
//  Created by Gabriel Sanzone - Job on 09/09/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

public enum ColorValue: String {
    case primaryColor
    case backgroudColor
    case cardColor
    case buttonColor
    case textFieldBackgroud
    case labelColor
    case buttonColorError
}

public extension UIColor {

    convenience init?(value: ColorValue) {
        self.init(named: value.rawValue)
    }

    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    func isLight() -> Bool {
        guard let components = cgColor.components,
            components.count >= 3 else { return false }
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return !(brightness < 0.5)
    }

    public var complementaryColor: UIColor {
        if #available(iOS 13, tvOS 13, *) {
            return UIColor { _ in
                return self.isLight() ? self.darker : self.lighter
            }
        } else {
            return isLight() ? darker : lighter
        }
    }

    public var lighter: UIColor {
        adjust(by: 1.35)
    }

    public var darker: UIColor {
        adjust(by: 0.94)
    }

    func adjust(by percent: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * percent, alpha: a)
    }

    func makeGradient() -> [UIColor] {
        [self, self.complementaryColor, self]
    }
}
