//
//  ButtomComponent.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public class ButtomComponent: UIButton  {

    public var buttonAction: (() -> Void)?

    override public var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            configHighlighted(isHighlighted: newValue)
            super.isHighlighted = newValue
        }
    }

    private var config: Configuration?

    public init() {
        super.init(frame: .zero)
        setupButton()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func configHighlighted(isHighlighted: Bool) {
        guard let config else { return }

        if isHighlighted {
            switch config.style {
            case .normal:
                backgroundColor = backgroundColor?.withAlphaComponent(0.7)
            case .normalCustom(color: let color, titleColor: let titleColor):
                backgroundColor = backgroundColor?.withAlphaComponent(0.7)
            case .outlined:
                backgroundColor = .gray.withAlphaComponent(0.1)
            case .link:
                setTitleColor(titleLabel?.textColor.withAlphaComponent(0.7), for: .normal)
            }
        } else {
            build(config: config)
        }
    }

    private func setupButton() {
        // Configurar aparência do botão
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        layer.cornerRadius = 25
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50)
        ])

    }

    @objc
    private func buttonTapped() {
        buttonAction?()
    }
}

public extension ButtomComponent {

    struct Configuration {
        let title: String
        let style: Style
        let image: UIImage?
        let tintImage: UIColor

        init(title: String, style: Style = .normal, image: UIImage? = nil, tintImage: UIColor = .black) {
            self.title = title
            self.style = style
            self.image = image
            self.tintImage = tintImage
        }

        enum Style {
            case normal
            case normalCustom(color: ColorValue, titleColor: UIColor)
            case outlined
            case link
        }
    }

    func build(config: Configuration) {
        self.config = config

        if let image = config.image {
            setImage(image, for: .normal)
            imageView?.tintColor = config.tintImage
        }
        setTitle(config.title, for: .normal)

        switch config.style {
        case .normal:
            backgroundColor = UIColor(value: .buttonColor)
        case .normalCustom(let color, let titleColor):
            backgroundColor = UIColor(value: color)
            setTitleColor(titleColor, for: .normal)
        case .outlined:
            layer.borderWidth = 1
            layer.borderColor = UIColor(value: .buttonColor)?.cgColor
            backgroundColor = .clear
        case .link:
            setTitleColor(UIColor(value: .buttonColor), for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 12.0)
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: 25)
            ])
            break
        }
    }
}
