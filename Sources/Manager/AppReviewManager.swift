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
    @MainActor
    public static func requestReviewIfNeeded(threshold: Int = 3) {
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: hasReviewedKey) {
            return
        }
        
        var count = defaults.integer(forKey: launchCountKey)
        count += 1
        defaults.set(count, forKey: launchCountKey)
        
        guard count == threshold else { return }

        #if os(tvOS)
        SKStoreReviewController.requestReview()
        defaults.set(true, forKey: hasReviewedKey)
        #else
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }

        if #available(iOS 18.0, *) {
            Task {
                await AppStore.requestReview(in: scene)
                defaults.set(true, forKey: hasReviewedKey)
            }
        } else {
            SKStoreReviewController.requestReview(in: scene)
            defaults.set(true, forKey: hasReviewedKey)
        }
        #endif
    }
}
