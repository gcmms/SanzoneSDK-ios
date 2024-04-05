//
//  ErrorDisplayable.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public protocol ErrorDisplayable {
    func showError(configuration: ErrorComponentConfiguration)
    func showGenericError()
}

public extension ErrorDisplayable where Self: UIViewController {
    var errorBackgroundColor: UIColor {
        return view.backgroundColor ?? UIColor.red
    }

    func showError(configuration: ErrorComponentConfiguration) {
        NotificationCenter.default.post(name: .trackShowError, object: nil)
        view.showError(config: configuration, backgroundColor: errorBackgroundColor)
    }

    func showGenericError() {
        self.showError(
            configuration: .init(
                title: "Erro inesperado",
                errorMessage: "Tente novamente mais tarde",
                buttonConfiguration: nil
            ))
    }
}

public extension UIView {
    static var errorComponentKey = "UIView.ErrorComponent"

    private var errorComponent: ErrorComponent {
        guard let errorComponent = objc_getAssociatedObject(self, &UIView.errorComponentKey) as? ErrorComponent else {
            let component = ErrorComponent()
            objc_setAssociatedObject(self, &UIView.errorComponentKey, component, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return component
        }
        return errorComponent
    }

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

    func hideError() {
        errorComponent.removeFromSuperview()
    }
}
