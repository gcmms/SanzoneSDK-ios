//
//  LoadingComponent.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

public final class LoadingComponent: UIView {

    public let position: LoadingPosition

    private lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()

    private let contentView = {
        let view = UIView(backgroud: .white)
        view.setRadius(radius: 10)
        return view
    }()

    private lazy var loadingView = {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat.pi * 2.0
        rotationAnimation.duration = 1.0 // Tempo para uma rotação completa em segundos
        rotationAnimation.repeatCount = .infinity // Repetir indefinidamente

        let view = UIImageView(imageAssets: .loadingImageView)
        view.layer.add(rotationAnimation, forKey: "rotationAnimation")
        return view
    }()

    public init(frame: CGRect = UIScreen.main.bounds, position: LoadingPosition = .center) {
        self.position = position
        super.init(frame: frame)
        self.setupViewCodeElement()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }

    public func startLoading() {
        isHidden = false
    }

    public func stopLoading() {
        self.isHidden = true
    }

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

public extension LoadingComponent {
    enum LoadingPosition {
        case center
    }
}

extension LoadingComponent {
    private enum Constants {
        static let imageWidth: CGFloat = 28.5 * imageScale
        static let imageHeight: CGFloat = 17 * imageScale
        static let animationDuration: TimeInterval = 1.5
        static let imageScale: CGFloat = 0.85
    }
}
