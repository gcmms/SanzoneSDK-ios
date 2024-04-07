//
//  UIImage.swift
//  SanzoneSDK
//
//  Criado por Gabriel Sanzone - Job em 15/09/22.
//

import Foundation
import UIKit

/// Extensão que adiciona funcionalidades adicionais à classe UIImage.
public extension UIImage {

    /// Retorna o UIImage correspondente ao asset personalizado especificado.
    ///
    /// - Parameter value: O nome do asset personalizado.
    /// - Returns: O UIImage correspondente ao asset personalizado.
    static func getAssets(_ value: Assets) -> UIImage {
        return UIImage(named: value.rawValue) ?? UIImage()
    }

    /// Retorna o UIImage correspondente ao asset do sistema especificado.
    ///
    /// - Parameter value: O nome do asset do sistema.
    /// - Returns: O UIImage correspondente ao asset do sistema.
    static func getSystemAssets(_ value: AssetsSystem) -> UIImage {
        return UIImage(systemName: value.rawValue) ?? UIImage()
    }
}

/// Extensão que adiciona inicializadores convenientes à classe UIImageView.
public extension UIImageView {

    /// Inicializa uma instância de UIImageView com um asset personalizado e um raio de cantos opcional.
    ///
    /// - Parameters:
    ///   - imageAssets: O asset personalizado a ser exibido na UIImageView.
    ///   - radius: O raio de cantos opcional para a UIImageView.
    convenience init(imageAssets: Assets, radius: CGFloat = 0) {
        self.init()
        image = UIImage.getAssets(imageAssets)
        setRadius(radius: radius)
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }

    /// Inicializa uma instância de UIImageView com um asset do sistema e um raio de cantos opcional.
    ///
    /// - Parameters:
    ///   - sfSymbols: O asset do sistema a ser exibido na UIImageView.
    ///   - radius: O raio de cantos opcional para a UIImageView.
    convenience init(sfSymbols: AssetsSystem, radius: CGFloat = 0) {
        self.init()
        image = UIImage.getSystemAssets(sfSymbols)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

/// Enumeração que representa os nomes dos assets do sistema.
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
    case arrowDownRightCircle = "arrow.down.right.circle"
    case arrowRightCircleFill = "arrow.right.circle.fill"
    case bell = "bell"
    case bellFill = "bell.fill"
    case squareAndArrowUpOnSquare = "square.and.arrow.up.on.square"
    case squareAndArrowDownOnSquare = "square.and.arrow.down.on.square"
    case gearshape = "gearshape"
    case gearshapeFill = "gearshape.fill"
    case gear = "gear"
    case gearFill = "gear.fill"
    case bolt = "bolt"
    case boltFill = "bolt.fill"
    case clock = "clock"
    case clockFill = "clock.fill"
    case heart = "heart"
    case heartFill = "heart.fill"
    case star = "star"
    case starFill = "star.fill"
    case arrowLeft = "arrow.left"
    case arrowRight = "arrow.right"
    case arrowUp = "arrow.up"
    case arrowDown = "arrow.down"
    case arrowLeftCircle = "arrow.left.circle"
    case arrowLeftCircleFill = "arrow.left.circle.fill"
    case arrowRightCircle = "arrow.right.circle"
    case arrowUpCircle = "arrow.up.circle"
    case arrowUpCircleFill = "arrow.up.circle.fill"
    case arrowDownCircle = "arrow.down.circle"
    case arrowDownCircleFill = "arrow.down.circle.fill"
    case squareAndArrowUp = "square.and.arrow.up"
    case squareAndArrowDown = "square.and.arrow.down"
    case squareAndArrowUpFill = "square.and.arrow.up.fill"
    case squareAndArrowDownFill = "square.and.arrow.down.fill"
    case smartPhone = "iphone.smartbatterycase.gen2"
}

/// Enumeração que representa os nomes dos assets personalizados.
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
    case DemoImage // TODO REMOVER
}
