//
//  LoadingComponent.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public final class LoadingComponent: UIView {

    /// The position of the loading indicator within its superview.
    public let position: LoadingPosition

    /// The background view behind the loading indicator.
    private lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()

    /// The content view containing the loading indicator.
    private let contentView = {
        let view = UIView(backgroud: .white) // Typo: Should be "background" instead of "backgroud"
        view.setRadius(radius: 10)
        return view
    }()

    /// The loading indicator view.
    private lazy var loadingView = {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat.pi * 2.0
        rotationAnimation.duration = 1.0 // Time for one complete rotation in seconds
        rotationAnimation.repeatCount = .infinity // Repeat indefinitely

        let view = UIImageView(imageAssets: .loadingImageView) // Typo: Should be "imageAsset" instead of "imageAssets"
        view.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return view
    }()

    /// Initializes the loading component with the specified frame and position.
    /// - Parameters:
    ///   - frame: The frame of the loading component.
    ///   - position: The position of the loading indicator within its superview.
    public init(frame: CGRect = UIScreen.main.bounds, position: LoadingPosition = .center) {
        self.position = position
        super.init(frame: frame)
        self.setupViewCodeElement()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }

    /// Starts displaying the loading indicator.
    public func startLoading() {
        isHidden = false
    }

    /// Stops displaying the loading indicator.
    public func stopLoading() {
        self.isHidden = true
    }

    /// Sets the background color of the loading component.
    /// - Parameter color: The background color to set.
    public func setBackgroundColor(_ color: UIColor) {
        backgroundView.backgroundColor = color
    }
}

extension LoadingComponent: ViewCodeProtocol {

    public func configureView() {
        backgroundView.alpha = 0.6
    }

    public func addSubviews() {
        add(backgroundView)
        add(contentView)
        contentView.add(loadingView)
    }

    public func defineSubviewConstraints() {
        backgroundView.pinToBounds(of: self)
        contentView.pinViewToCenter(of: self)
        contentView.setSizeToView(widthConstant: 80, heightConstant: 80)
        loadingView.pinViewToCenter(of: contentView)
    }
}

/// An enumeration representing the position of the loading indicator within its superview.
public extension LoadingComponent {
    enum LoadingPosition {
        case center
    }
}

extension LoadingComponent {
    /// Constants used for sizing and animating the loading indicator.
    private enum Constants {
        static let imageWidth: CGFloat = 28.5 * imageScale
        static let imageHeight: CGFloat = 17 * imageScale
        static let animationDuration: TimeInterval = 1.5
        static let imageScale: CGFloat = 0.85
    }
}

