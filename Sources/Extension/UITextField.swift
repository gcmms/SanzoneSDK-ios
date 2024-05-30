//
//  UITextField.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 27/03/23.
//  Copyright © 2023 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

public extension UITextField {

    convenience init(borderStyle: UITextField.BorderStyle, _ delegade: UITextFieldDelegate? = nil) {
        self.init()
        self.borderStyle = borderStyle
        self.delegate = delegade
        translatesAutoresizingMaskIntoConstraints = false
    }
}
