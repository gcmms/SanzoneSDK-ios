//
//  UIStackView.swift
//  SanzoneSDk
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 10/02/23.
//  Copyright © 2023 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init()

        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init()

        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setCustomSpacing(_ spacing: CGFloat, before: UIView) {
        guard let currentViewIndex = self.arrangedSubviews.firstIndex(where: { $0 == before }) else {
            return
        }
        let beforeViewIndex = currentViewIndex - 1

        guard beforeViewIndex >= 0 else { return }

        let beforeView = self.arrangedSubviews[beforeViewIndex]
        self.setCustomSpacing(spacing, after: beforeView)
    }

    func addArrangedSubviews(_ views: [UIView]) {

        for view in views { self.addArrangedSubview(view) }

    }

    func removeArrangedSubviews(_ views: [UIView]) {

        for view in views { self.removeArrangedSubview(view) }

    }

    func removeAllArrangedSubviews(includingFromSuperview: Bool = false) {

        for view in self.arrangedSubviews {

            self.removeArrangedSubview(view)

            if includingFromSuperview == true {

                view.removeFromSuperview()
            }
        }
    }
}


