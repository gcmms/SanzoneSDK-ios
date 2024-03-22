//
//  UIStackView.swift
//  SanzoneSDk
//
//  Criado por Gabriel Chirico Mahtuk de Melo Sanzone em 10/02/23.
//

import UIKit

/// Extensão que adiciona métodos convenientes à classe UIStackView para facilitar a manipulação de arranjos de subvisualizações.
public extension UIStackView {

    /// Inicializa uma instância de UIStackView com o eixo especificado.
    ///
    /// - Parameter axis: O eixo de layout do stack view.
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    /// Inicializa uma instância de UIStackView com o eixo e o espaçamento especificados.
    ///
    /// - Parameters:
    ///   - axis: O eixo de layout do stack view.
    ///   - spacing: O espaçamento entre as visualizações organizadas no stack view.
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    /// Define um espaçamento personalizado entre uma visualização e a visualização anterior no stack view.
    ///
    /// - Parameters:
    ///   - spacing: O espaçamento personalizado a ser definido.
    ///   - before: A visualização antes da qual o espaçamento será aplicado.
    func setCustomSpacing(_ spacing: CGFloat, before: UIView) {
        guard let currentViewIndex = self.arrangedSubviews.firstIndex(where: { $0 == before }) else {
            return
        }
        let beforeViewIndex = currentViewIndex - 1

        guard beforeViewIndex >= 0 else { return }

        let beforeView = self.arrangedSubviews[beforeViewIndex]
        self.setCustomSpacing(spacing, after: beforeView)
    }

    /// Adiciona várias visualizações organizadas ao stack view.
    ///
    /// - Parameter views: As visualizações a serem adicionadas ao stack view.
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views { self.addArrangedSubview(view) }
    }

    /// Remove várias visualizações organizadas do stack view.
    ///
    /// - Parameter views: As visualizações a serem removidas do stack view.
    func removeArrangedSubviews(_ views: [UIView]) {
        for view in views { self.removeArrangedSubview(view) }
    }

    /// Remove todas as visualizações organizadas do stack view, opcionalmente removendo-as também de seus respectivos superviews.
    ///
    /// - Parameter includingFromSuperview: Um valor booleano que indica se as visualizações também devem ser removidas de seus respectivos superviews.
    func removeAllArrangedSubviews(includingFromSuperview: Bool = false) {
        for view in self.arrangedSubviews {
            self.removeArrangedSubview(view)
            if includingFromSuperview {
                view.removeFromSuperview()
            }
        }
    }
}
