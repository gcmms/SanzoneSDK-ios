//
//  UIView.swift
//  SanzoneSDK
//
//  Created by Gabriel Sanzone - Job on 11/11/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    convenience init(backgroud: UIColor) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = backgroud
    }
    
    func setupShadow(
        shadowColor: CGColor = UIColor.black.cgColor,
        shadowOpacity: Float = 0.2,
        shadowOffset: CGSize = CGSize(width: 2, height: 2),
        shadowRadius: CGFloat = 4
    ) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }

    func setupGradient() {
        guard let corInicial = UIColor(value: .backgroudColor) else { return }
        let corFinal = corInicial.withAlphaComponent(0.7)

        let gradienteLayer = CAGradientLayer()
        gradienteLayer.colors = [corInicial.cgColor, corFinal.cgColor]

        gradienteLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradienteLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        gradienteLayer.frame = bounds
        layer.insertSublayer(gradienteLayer, at: 0)
    }

    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
        self.layer.masksToBounds = true
    }

    func pinToBounds(
        of view: UIView,
        topConstant: CGFloat = 0,
        leadingConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        trailingConstant: CGFloat = 0
    ) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstant)
        ])
    }

    func pinToBounds(of view: UIView, useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor),
            leadingAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor),
            trailingAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor),
            bottomAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor)
        ])
    }

    func pinViewToCenter(
        of view: UIView
    ) {
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),        ])
    }

    func setSizeToView(
        widthConstant: CGFloat? = 0,
        heightConstant: CGFloat? = 0
    ) {
        var constraints = [NSLayoutConstraint]()
        if let widthConstant {
            constraints.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }

        if let heightConstant {
            constraints.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        NSLayoutConstraint.activate(constraints)
    }

    func add(_ subviews: UIView...) {
        subviews.forEach(
            self.addSubview
        )

        for view in subviews { view.translatesAutoresizingMaskIntoConstraints = false }
    }

    func removeAllSubviews() {
        for view in subviews { view.removeFromSuperview() }
    }
}

extension CACornerMask {
    static let bottomLeft = CACornerMask.layerMinXMaxYCorner
    static let bottomRight = CACornerMask.layerMaxXMaxYCorner
    static let topLeft = CACornerMask.layerMinXMinYCorner
    static let topRight = CACornerMask.layerMaxXMinYCorner
}
