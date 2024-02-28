//
//  UIImage.swift
//  SanzoneSDK
//
//  Created by Gabriel Sanzone - Job on 15/09/22.
//  Copyright © 2022 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import UIKit

public enum Assets: String {
    case brandLogo = "logoIcon"
    case loadingImageView
    case checkboxChecked
    case checkboxUnchecked
    case doneOccurence
    case finishOccurrence
    case pendingOccurrence
    case waitingOccurrencce
    case photoPickerViewPlaceholder = "PhotoPickerView_PlaceholderImage"
    case DemoImage// TODO REMOVE
}

public enum AssetsSystem: String {
    case envelope
    case lock
    case playTV = "play.tv"
    case house
    case map
    case chevronRight = "chevron.right"
    case chevronDown = "chevron.down"
    case person = "person"
    case personCircle = "person.circle"
    case camera = "camera.fill"
    case photoPlus = "photo.badge.plus"
    case scope
    case plus
    case done = "arrowshape.right.fill"
}

public extension UIImage {

    static func getAssets(_ value: Assets) -> UIImage {
        return UIImage(named: value.rawValue) ?? UIImage()
    }

    static func getSystemAssets(_ value: AssetsSystem) -> UIImage {
        return UIImage(systemName: value.rawValue) ?? UIImage()
    }
}

public extension UIImageView {

    convenience init(imageAssets: Assets, radius: CGFloat = 0) {
        self.init()
        image = UIImage.getAssets(imageAssets)
        setRadius(radius: radius)
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }

    convenience init(sfSymbols: AssetsSystem, radius: CGFloat = 0) {
        self.init()
        image = UIImage.getSystemAssets(sfSymbols)
        translatesAutoresizingMaskIntoConstraints = false
    }


}
