//
//  LabelComponent.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 28/02/24.
//

import Foundation
import UIKit

class LabelComponent: UILabel {

    init() {
        super.init(frame: .zero)
        textColor = UIColor(value: .labelColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
