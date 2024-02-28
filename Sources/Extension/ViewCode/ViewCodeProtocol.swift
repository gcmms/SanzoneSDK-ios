//
//  ViewCodeProtocol.swift
//  SanzoneSDK
//
//  Created by Gabriel Sanzone - Job on 05/11/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

protocol ViewCodeProtocol {
    func setupViewCodeElement()
    func addSubviews()
    func defineSubviewConstraints()
    func configureView()
}

extension ViewCodeProtocol {
    func setupViewCodeElement() {
        addSubviews()
        defineSubviewConstraints()
        configureView()
    }

    func configureView() {}

    // MARK: - Constraints configurations
    func activateConstraintsWithLowerLayoutPriority(_ constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            constraint.priority = UILayoutPriority(999.0)
            constraint.isActive = true
        }
    }
}
