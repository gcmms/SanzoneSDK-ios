//
//  LoadingDisplayable.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

/// A protocol for view controllers that display loading indicators.
public protocol LoadingDisplayable {
    /// A Boolean value indicating whether a loading indicator is currently being displayed.
    var isLoading: Bool { get set }
    /// The background color of the loading indicator.
    var loadingBackgroundColor: UIColor { get }
    /// Sets whether the loading reference count is enabled.
    func setLoadingReferenceCount(enabled: Bool)
}

public extension LoadingDisplayable where Self: UIViewController {
    /// The default background color for the loading indicator.
    var loadingBackgroundColor: UIColor {
        let color = UIColor.gray
        return color
    }

    /// Indicates whether the loading indicator is currently being displayed.
    var isLoading: Bool {
        get {
            return false
        }
        set {
            guard getLoadingReferenceCountEnabled() else {
                newValue ? view.showLoading(backgroundColor: loadingBackgroundColor) : view.hideLoading()
                return
            }

            let initialLoadingReferenceCount = getLoadingReferenceCount()
            set(loadingReferenceCount: newValue ? initialLoadingReferenceCount + 1 : max(initialLoadingReferenceCount - 1, 0))
            let currentLoadingReferenceCount = getLoadingReferenceCount()

            let loadingIsStarting = initialLoadingReferenceCount == 0 && currentLoadingReferenceCount > 0
            let loadingIsFinishing = initialLoadingReferenceCount > 0 && currentLoadingReferenceCount == 0
            if loadingIsStarting {
                view.showLoading(backgroundColor: loadingBackgroundColor)
            } else if loadingIsFinishing {
                view.hideLoading()
            }
        }
    }
}

/// A private key for associating loading reference count enabled state with a view.
private var loadingReferenceCountEnabledKey = "UIView.LoadingReferenceCountEnabled"
/// A private key for associating loading reference count with a view.
private var loadingReferenceCountKey = "UIView.LoadingReferenceCount"

public extension LoadingDisplayable {
    /// Sets whether the loading reference count is enabled.
    func setLoadingReferenceCount(enabled: Bool) {
        objc_setAssociatedObject(self, &loadingReferenceCountEnabledKey, enabled, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if !enabled {
            set(loadingReferenceCount: 0)
        }
    }

    /// Retrieves whether the loading reference count is enabled.
    private func getLoadingReferenceCountEnabled() -> Bool {
        guard let loadingReferenceCountEnabled = objc_getAssociatedObject(self, &loadingReferenceCountEnabledKey) as? Bool else {
            setLoadingReferenceCount(enabled: false)
            return false
        }
        return loadingReferenceCountEnabled
    }

    /// Retrieves the current loading reference count.
    private func getLoadingReferenceCount() -> Int {
        guard let loadingReferenceCount = objc_getAssociatedObject(self, &loadingReferenceCountKey) as? Int else {
            set(loadingReferenceCount: 0)
            return 0
        }
        return loadingReferenceCount
    }

    /// Sets the loading reference count.
    private func set(loadingReferenceCount: Int) {
        objc_setAssociatedObject(self, &loadingReferenceCountKey, loadingReferenceCount, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

public extension UIView {
    /// A private key for associating the loading component with a view.
    static var loadingComponentKey = "UIView.LoadingComponent"

    /// Retrieves the loading component associated with a view.
    private var loadingComponent: LoadingComponent {
        guard let loadingComponent = objc_getAssociatedObject(self, &UIView.loadingComponentKey) as? LoadingComponent else {
            let component = LoadingComponent()
            component.isUserInteractionEnabled = false
            objc_setAssociatedObject(self, &UIView.loadingComponentKey, component, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return component
        }
        return loadingComponent
    }

    /// Displays the loading indicator on the view.
    /// - Parameter backgroundColor: The background color of the loading indicator.
    func showLoading(backgroundColor: UIColor? = nil) {
        hideError()
        if loadingComponent.superview != nil {
            loadingComponent.removeFromSuperview()
        }
        addSubview(loadingComponent)
        loadingComponent.pinToBounds(of: self)
        if let color = backgroundColor {
            loadingComponent.setBackgroundColor(color)
        }
        loadingComponent.startLoading()
    }

    /// Hides the loading indicator.
    func hideLoading() {
        loadingComponent.stopLoading()
        loadingComponent.removeFromSuperview()
    }
}
