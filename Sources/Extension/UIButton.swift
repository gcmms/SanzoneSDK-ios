//
//  UIButton.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 27/03/23.
//  Copyright © 2023 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

extension UIButton {

    convenience init(text: String) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(text, for: .normal)

    }

    func tintedButton() {
        if #available(iOS 15.0, *) {
            configuration = .tinted()
        } else {
            backgroundColor = .blue
        }
    }
}
