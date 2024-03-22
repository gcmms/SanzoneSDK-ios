//
//  LabelComponent.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 28/02/24.
//

import Foundation
import UIKit

/// Uma subclasse personalizada de `UILabel` com funcionalidades adicionais e opções de personalização.
public class LabelComponent: UILabel {

    /// Inicializa e retorna um novo objeto de componente de rótulo alocado com as configurações padrão.
    ///
    /// Este inicializador configura o rótulo com as configurações padrão, como a cor do texto.
    /// - Nota: Este inicializador deve ser utilizado ao criar um novo componente de rótulo programaticamente.
    public init() {
        super.init(frame: .zero)
        textColor = UIColor(value: .labelColor)
    }

    /// :nodoc:
    ///
    /// Este inicializador não é utilizado neste contexto e deve ser ignorado.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
