//
//  UIViewController.swift
//  Zela
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 16/01/24.
//

import UIKit

extension UIViewController {

    func configureNavigationBar(textColor: UIColor = UIColor.white) {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: textColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: textColor]
        appearance.backgroundColor = .clear
        appearance.backgroundEffect = nil
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

}
