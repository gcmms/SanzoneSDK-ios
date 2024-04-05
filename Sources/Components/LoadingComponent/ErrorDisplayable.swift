//
//  ErrorDisplayable.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public protocol ErrorDisplayable {
    /// Displays an error message with the given configuration.
    /// - Parameter configuration: The configuration for the error component.
    func showError(configuration: ErrorComponentConfiguration)

    /// Displays a generic error message.
    func showGenericError()
}

public extension ErrorDisplayable where Self: UIViewController {
    /// The background color to be used for the error component.
    var errorBackgroundColor: UIColor {
        return view.backgroundColor ?? UIColor.red
    }

    /// Displays an error message with the given configuration.
    /// - Parameter configuration: The configuration for the error component.
    func showError(configuration: ErrorComponentConfiguration) {
        NotificationCenter.default.post(name: .trackShowError, object: nil)
        view.showError(config: configuration, backgroundColor: errorBackgroundColor)
    }

    /// Displays a generic error message.
    func showGenericError() {
        self.showError(
            configuration: .init(
                title: "Erro inesperado",
                errorMessage: "Tente novamente mais tarde",
                buttonConfiguration: nil
            )
        )
    }
}

public extension UIView {
    /// Key used to associate the error component with the view.
    static var errorComponentKey = "UIView.ErrorComponent"

    /// The error component associated with the view.
    private var errorComponent: ErrorComponent {
        guard let errorComponent = objc_getAssociatedObject(self, &UIView.errorComponentKey) as? ErrorComponent else {
            let component = ErrorComponent()
            objc_setAssociatedObject(self, &UIView.errorComponentKey, component, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return component
        }
        return errorComponent
    }

    /// Displays an error message with the given configuration.
    /// - Parameters:
    ///   - config: The configuration for the error component.
    ///   - backgroundColor: The background color for the error component.
    func showError(config: ErrorComponentConfiguration, backgroundColor: UIColor? = nil) {
        errorComponent.backgroundColor = UIColor(value: .primaryColor)
        hideLoading()
        if errorComponent.superview != nil {
            errorComponent.removeFromSuperview()
        }
        if let color = backgroundColor {
            errorComponent.setBackgroundColor(color)
        }
        errorComponent.build(config: config)
        add(errorComponent)
        errorComponent.pinToBounds(of: self)
    }

    /// Hides the error component.
    func hideError() {
        errorComponent.removeFromSuperview()
    }
}
