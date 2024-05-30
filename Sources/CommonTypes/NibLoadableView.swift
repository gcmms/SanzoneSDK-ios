//
//  NibLoadableView.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 20/03/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
