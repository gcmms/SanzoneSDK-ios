//
//  UITableView.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 20/03/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {

    func registerNib<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
