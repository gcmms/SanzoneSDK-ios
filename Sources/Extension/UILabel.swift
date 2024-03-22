//
//  UILabel.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 27/03/23.
//  Copyright © 2023 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

public extension LabelComponent {

    convenience init(text: String = "", size: CGFloat, weight: UIFont.Weight) {
        self.init()
        self.text = text
        font = UIFont.systemFont(ofSize: size, weight: weight)
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }

    convenience init(text: String = "") {
        self.init()
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }

    func font(type: UILabelType, size: CGFloat) {
        font = UIFont(name: type.rawValue, size: size) ?? .systemFont(ofSize: size)
    }

    enum UILabelType: String {
        case bold = "HelveticaNeue-Bold"
        case medium = "HelveticaNeue-Medium"
    }
}
