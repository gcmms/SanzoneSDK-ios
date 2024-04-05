//
//  ButtomComponent.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

/// A customizable button component.
public class ButtomComponent: UIButton  {

    /// A closure representing the action to be executed when the button is tapped.
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

    /// Initializes the button component.
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
        // Configure button appearance
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

    /// The configuration options for the button component.
    struct Configuration {
        let title: String
        let style: Style
        let image: UIImage?
        let tintImage: UIColor

        /// Initializes the button configuration with specified parameters.
        public init(title: String, style: Style = .normal, image: UIImage? = nil, tintImage: UIColor = .black) {
            self.title = title
            self.style = style
            self.image = image
            self.tintImage = tintImage
        }

        /// The style options for the button component.
        public enum Style {
            case normal
            case normalCustom(color: ColorValue, titleColor: UIColor)
            case outlined
            case link
        }
    }

    /// Builds the button component with the given configuration.
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
