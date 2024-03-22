//
//  UIViewController.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 16/01/24.
//

import UIKit

public extension UIViewController {

    /// Configura a barra de navegação do controlador de visualização atual.
    ///
    /// - Parameters:
    ///   - textColor: A cor do texto da barra de navegação. O padrão é branco.
    func configureNavigationBar(textColor: UIColor = UIColor.white) {
        // Cria uma nova aparência para a barra de navegação
        let appearance = UINavigationBarAppearance()

        // Define as atributos do texto do título da barra de navegação
        appearance.titleTextAttributes = [.foregroundColor: textColor]

        // Define as atributos do texto do título grande da barra de navegação
        appearance.largeTitleTextAttributes = [.foregroundColor: textColor]

        // Define a cor de fundo da barra de navegação como transparente
        appearance.backgroundColor = .clear

        // Remove o efeito de fundo da barra de navegação
        appearance.backgroundEffect = nil

        // Aplica a nova aparência à barra de navegação padrão
        navigationItem.standardAppearance = appearance

        // Aplica a nova aparência à barra de navegação para rolagem
        navigationItem.scrollEdgeAppearance = appearance
    }


}
