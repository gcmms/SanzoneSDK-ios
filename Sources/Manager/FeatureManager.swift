//
//  File.swift
//  
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 05/04/24.
//

import Foundation
import UIKit

protocol FeatureManager {
    static var shared: FeatureManager { get }
    var delegate: FeatureManagerDelegate? { get set }
    func build() -> UIViewController
}

protocol FeatureManagerDelegate: AnyObject {

}
