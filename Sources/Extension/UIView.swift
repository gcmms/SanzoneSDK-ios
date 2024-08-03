//
//  UIView.swift
//  SanzoneSDK
//
//  Created by Gabriel Sanzone - Job on 11/11/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

/// Extensão que fornece métodos convenientes para manipulação de UIView.
public extension UIView {

    /// Inicializa uma nova instância de UIView com a cor de fundo especificada.
    ///
    /// - Parameter backgroud: A cor de fundo da view.
    convenience init(backgroud: UIColor) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = backgroud
    }

    /// Aplica uma sombra à view.
    ///
    /// - Parameters:
    ///   - shadowColor: A cor da sombra.
    ///   - shadowOpacity: A opacidade da sombra.
    ///   - shadowOffset: O deslocamento da sombra.
    ///   - shadowRadius: O raio da sombra.
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

    /// Aplica um gradiente à view.
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

    /// Define o raio da view.
    ///
    /// - Parameter radius: O raio da view.
    func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
        self.layer.masksToBounds = true
    }

    /// Fixa a view às bordas de outra view com as constantes especificadas.
    ///
    /// - Parameters:
    ///   - view: A view à qual a view atual será fixada.
    ///   - topConstant: A constante superior.
    ///   - leadingConstant: A constante de liderança.
    ///   - bottomConstant: A constante inferior.
    ///   - trailingConstant: A constante de trilhamento.
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

    /// Fixa a view às bordas de outra view, opcionalmente utilizando a área segura.
    ///
    /// - Parameters:
    ///   - view: A view à qual a view atual será fixada.
    ///   - useSafeArea: Um valor booleano que indica se a área segura deve ser utilizada.
    func pinToBounds(of view: UIView, useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor),
            leadingAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor),
            trailingAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor),
            bottomAnchor.constraint(equalTo: useSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor)
        ])
    }

    /// Centraliza a view em outra view.
    ///
    /// - Parameter view: A view na qual a view atual será centralizada.
    func pinViewToCenter(of view: UIView) {
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    /// Define o tamanho da view com constantes de largura e altura especificadas.
    ///
    /// - Parameters:
    ///   - widthConstant: A constante de largura da view.
    ///   - heightConstant: A constante de altura da view.
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

    /// Adiciona uma ou mais subviews à view atual.
    ///
    /// - Parameter subviews: As subviews a serem adicionadas à view atual.
    func add(_ subviews: UIView...) {
        subviews.forEach(
            self.addSubview
        )

        for view in subviews { view.translatesAutoresizingMaskIntoConstraints = false }
    }

    /// Remove todas as subviews da view atual.
    func removeAllSubviews() {
        for view in subviews { view.removeFromSuperview() }
    }
    
    /// remove all Gesture Recognizers
    func removeAllGestureRecognizers() {
        self.gestureRecognizers?.forEach(self.removeGestureRecognizer)
    }
}

public extension CACornerMask {
    static let bottomLeft = CACornerMask.layerMinXMaxYCorner
    static let bottomRight = CACornerMask.layerMaxXMaxYCorner
    static let topLeft = CACornerMask.layerMinXMinYCorner
    static let topRight = CACornerMask.layerMaxXMinYCorner
}
