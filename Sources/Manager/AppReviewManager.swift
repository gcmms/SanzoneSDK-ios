//
//  RequestSimulation.swift
//
//
//  Created by Gabriel Sanzone on 02/08/2025.
//

import StoreKit
import UIKit

public class AppReviewManager {
    
    private static let launchCountKey = "appReviewLaunchCount"
    private static let hasReviewedKey = "appHasRequestedReview"
    
    /// Solicita a avaliação do app após um número definido de ativações. Só será exibido uma vez por instalação.
    /// - Parameter threshold: Número de vezes que a função precisa ser chamada antes de exibir a review. Default = 3.
    public static func requestReviewIfNeeded(threshold: Int = 3) {
        let defaults = UserDefaults.standard

        // Verifica se já solicitou antes
        if defaults.bool(forKey: hasReviewedKey) {
            return
        }

        // Incrementa contador
        var count = defaults.integer(forKey: launchCountKey)
        count += 1
        defaults.set(count, forKey: launchCountKey)

        // Solicita avaliação se atingiu o limite
        if count == threshold {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if #available(iOS 18.0, *) {
                    AppStore.requestReview(in: scene)
                } else {
                    SKStoreReviewController.requestReview(in: scene)
                }
                defaults.set(true, forKey: hasReviewedKey)
            }
        }
    }
}
