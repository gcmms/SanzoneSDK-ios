//
//  RequestSimulation.swift
//
//
//  Created by Gabriel Sanzone on 03/08/24.
//

import Foundation

public class RequestSimulation {
    
    static func simulation(time: UInt32 = 2, action: (() -> Void)?) {
        DispatchQueue.global().async {
            // Simular um atraso de rede
            sleep(time)
            DispatchQueue.main.async {
                action?()
            }
        }
    }
    
}
