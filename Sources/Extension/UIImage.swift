//
//  UIImage.swift
//  SanzoneSDK
//
//  Criado por Gabriel Sanzone - Job em 15/09/22.
//

import Foundation
import UIKit

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
}

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
