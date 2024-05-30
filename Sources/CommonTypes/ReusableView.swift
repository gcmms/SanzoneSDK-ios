//
//  ReusableView.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 19/03/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
