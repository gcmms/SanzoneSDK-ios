//
//  RegisterTableViewCell.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 17/04/24.
//

import Foundation
import UIKit

protocol RegisterTableViewCell: UITableViewCell {
    static var reuseIdentifier: String { get }
    static func register(_ tableView: UITableView)
}

extension RegisterTableViewCell {
    static func register(_ tableView: UITableView) {
        tableView.register(
            self,
            forCellReuseIdentifier: self.reuseIdentifier
        )
    }
}
