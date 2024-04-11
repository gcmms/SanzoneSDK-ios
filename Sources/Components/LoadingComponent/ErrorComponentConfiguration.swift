//
//  ErrorComponentConfiguration.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public struct ErrorComponentButtonConfiguration {
    public let title: String
    public let action: () -> Void

    /// Initializes the error component button configuration.
    /// - Parameters:
    ///   - title: The title text for the button.
    ///   - action: The action to be performed when the button is tapped.
    public init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
}

/// Configuration for the error component.
public struct ErrorComponentConfiguration {
    public let title: String?
    public let errorMessage: String?
    public let buttonConfiguration: ErrorComponentButtonConfiguration?

    /// Initializes the error component configuration.
    /// - Parameters:
    ///   - title: The title text for the error component.
    ///   - errorMessage: The error message to be displayed.
    ///   - buttonConfiguration: The configuration for the error component button.
    public init(
        title: String?,
        errorMessage: String?,
        buttonConfiguration: ErrorComponentButtonConfiguration?
    ) {
        self.title = title
        self.errorMessage = errorMessage
        self.buttonConfiguration = buttonConfiguration
    }

    /// Creates a generic error component configuration with a default "Try Again" button title.
    /// - Parameter buttonAction: The action to be performed when the button is tapped.
    /// - Returns: An instance of `ErrorComponentConfiguration` with generic settings.
    public static func generic(buttonAction: (() -> Void)? = nil) -> ErrorComponentConfiguration {
        return self.init(
            title: "Something Went Wrong",
            errorMessage: "An error occurred. Please try again later.",
            buttonConfiguration: buttonAction.map {
                ErrorComponentButtonConfiguration(
                    title: "Try Again",
                    action: $0
                )
            }
        )
    }
}

/// View component for displaying error messages.
public final class ErrorComponent: UIView {

    private let contentView = UIView()
    private let stackContentView = UIView()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let stackView: UIStackView = UIStackView(axis: .vertical, spacing: 16)

    private lazy var button: ButtomComponent = {
        let view = ButtomComponent()
        view.build(config: .init(
            title: "",
            style: .normal
        ))
        view.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        return view
    }()

    private var buttonCallback: (() -> Void)?

    private lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()

    /// Initializes the error component.
    public init() {
        super.init(frame: CGRect.zero)
        setupViewCodeElement()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    /// Configures the error component with the provided configuration.
    /// - Parameter config: The error component configuration.
    public func build(config: ErrorComponentConfiguration) {
        self.isHidden = false
        endEditing(true)
        if let title = config.title {
            titleLabel.text = title
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
        if let errorMessage = config.errorMessage {
            errorMessageLabel.text = errorMessage
            errorMessageLabel.isHidden = false
        } else {
            errorMessageLabel.isHidden = true
        }
        if let buttonConfiguration = config.buttonConfiguration {
            button.setTitle(buttonConfiguration.title, for: .normal)
            button.isHidden = false
            buttonCallback = buttonConfiguration.action
        } else {
            button.setTitle("Ok", for: .normal)
            button.isHidden = false
            buttonCallback = {
                self.isHidden = true
            }
        }
    }

    /// Sets the background color of the error component.
    /// - Parameter color: The color to set as the background color.
    public func setBackgroundColor(_ color: UIColor) {
        //backgroundView.backgroundColor = color
    }
}

extension ErrorComponent: ViewCodeProtocol {

    public func configureView() {
        isUserInteractionEnabled = true
        setupGradient()
        stackContentView.backgroundColor = .white
        backgroundView.setupGradient()
        stackContentView.setRadius(radius: 10)
        contentView.setupShadow()
    }

    public func addSubviews() {
        add(backgroundView, contentView)
        contentView.add(stackContentView)
        stackContentView.add(stackView)
        stackView.addArrangedSubviews([titleLabel, errorMessageLabel, button])
    }

    public func defineSubviewConstraints() {
        backgroundView.pinToBounds(of: self)
        contentView.pinViewToCenter(of: self)
        stackContentView.pinToBounds(
            of: contentView,
            topConstant: 25,
            leadingConstant: 25,
            bottomConstant: -25,
            trailingConstant: -25
        )

        stackView.pinToBounds(
            of: stackContentView,
            topConstant: 25,
            leadingConstant: 25,
            bottomConstant: -25,
            trailingConstant: -25
        )

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -15),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
        ])
    }
}

@objc
private extension ErrorComponent {
    func buttonWasTapped() {
        buttonCallback?()
    }
}
