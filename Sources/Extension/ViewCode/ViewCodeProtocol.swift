//
//  ViewCodeProtocol.swift
//  SanzoneSDK
//
//  Criado por Gabriel Sanzone - Job em 05/11/22.
//  Direitos autorais © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. Todos os direitos reservados.
//

import Foundation
import UIKit

/// Um protocolo que define métodos para configurar a interface do usuário usando o padrão View Code.
public protocol ViewCodeProtocol {

    /// Configura os elementos da interface do usuário usando o padrão View Code.
    func setupViewCodeElement()

    /// Adiciona as subviews à view principal.
    func addSubviews()

    /// Define as restrições das subviews na view principal.
    func defineSubviewConstraints()

    /// Configura a view.
    func configureView()
}

public extension ViewCodeProtocol {

    /// Configura os elementos da interface do usuário usando o padrão View Code.
    func setupViewCodeElement() {
        addSubviews()
        defineSubviewConstraints()
        configureView()
    }

    /// Configura a view.
    func configureView() {}

    // MARK: - Configurações de Restrições

    /// Ativa as restrições com prioridade de layout inferior.
    ///
    /// - Parameter constraints: As restrições a serem ativadas.
    func activateConstraintsWithLowerLayoutPriority(_ constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            constraint.priority = UILayoutPriority(999.0)
            constraint.isActive = true
        }
    }
}
