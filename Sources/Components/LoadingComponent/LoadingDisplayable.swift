//
//  LoadingDisplayable.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public protocol LoadingDisplayable {
    var isLoading: Bool { get set }
    var loadingBackgroundColor: UIColor { get }
    func setLoadingReferenceCount(enabled: Bool)
}

public extension LoadingDisplayable where Self: UIViewController {
    var loadingBackgroundColor: UIColor {
        let color = UIColor.gray
        return color
    }

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

private var loadingReferenceCountEnabledKey = "UIView.LoadingReferenceCountEnabled"
private var loadingReferenceCountKey = "UIView.LoadingReferenceCount"

public extension LoadingDisplayable {
    func setLoadingReferenceCount(enabled: Bool) {
        objc_setAssociatedObject(self, &loadingReferenceCountEnabledKey, enabled, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        if !enabled {
            set(loadingReferenceCount: 0)
        }
    }

    private func getLoadingReferenceCountEnabled() -> Bool {
        guard let loadingReferenceCountEnabled = objc_getAssociatedObject(self, &loadingReferenceCountEnabledKey) as? Bool else {
            setLoadingReferenceCount(enabled: false)
            return false
        }
        return loadingReferenceCountEnabled
    }

    private func getLoadingReferenceCount() -> Int {
        guard let loadingReferenceCount = objc_getAssociatedObject(self, &loadingReferenceCountKey) as? Int else {
            set(loadingReferenceCount: 0)
            return 0
        }
        return loadingReferenceCount
    }

    private func set(loadingReferenceCount: Int) {
        objc_setAssociatedObject(self, &loadingReferenceCountKey, loadingReferenceCount, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

public extension UIView {
    static var loadingComponentKey = "UIView.LoadingComponent"

    private var loadingComponent: LoadingComponent {
        guard let loadingComponent = objc_getAssociatedObject(self, &UIView.loadingComponentKey) as? LoadingComponent else {
            let component = LoadingComponent()
            component.isUserInteractionEnabled = false
            objc_setAssociatedObject(self, &UIView.loadingComponentKey, component, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return component
        }
        return loadingComponent
    }

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

    func hideLoading() {
        loadingComponent.stopLoading()
        loadingComponent.removeFromSuperview()
    }
}
