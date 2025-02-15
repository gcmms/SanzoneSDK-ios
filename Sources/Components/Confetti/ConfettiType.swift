//
//  ConfettiType.swift
//  SwiftUI Confetti
//
//  Created by Gabriel Sanzone on 15/02/25.
//

import UIKit

/// Classe que representa um tipo específico de confete.
public class ConfettiType {
    
    /// Cor do confete.
    let color: UIColor
    /// Formato do confete.
    let shape: ConfettiShape
    /// Posição do confete na camada de exibição.
    let position: ConfettiPosition
    
    /// Inicializa um ConfettiType com cor, formato e posição.
    init(color: UIColor, shape: ConfettiShape, position: ConfettiPosition) {
        self.color = color
        self.shape = shape
        self.position = position
    }
    
    /// Imagem do confete, gerada sob demanda.
    lazy var image: UIImage? = {
        // Define o tamanho da imagem baseado no formato do confete.
        let imageRect: CGRect = {
            switch shape {
            case .circle:
                return CGRect(x: 0, y: 0, width: 3, height: 3)
            case .rectangle:
                return CGRect(x: 0, y: 0, width: 4, height: 3)
            case .triangle:
                return CGRect(x: 0, y: 0, width: 4, height: 3)
            }
        }()
        
        // Cria um renderizador de imagem para desenhar o confete.
        let renderer = UIGraphicsImageRenderer(size: imageRect.size)
        return renderer.image { rendererContext in
            
            let context = rendererContext.cgContext
            context.setFillColor(color.cgColor) // Define a cor do confete
            
            switch shape {
            case .rectangle:
                context.fill(imageRect) // Desenha um retângulo preenchido
            case .circle:
                context.fillEllipse(in: imageRect) // Desenha um círculo preenchido
            case .triangle:
                let path = CGMutablePath()
                path.move(to: CGPoint(x: imageRect.minX, y: imageRect.minY))
                path.addLine(to: CGPoint(x: imageRect.maxX, y: imageRect.maxY))
                path.addLine(to: CGPoint(x: imageRect.minX, y: imageRect.maxY))
                path.closeSubpath()
                
                context.addPath(path)
                context.fillPath() // Preenche o caminho do triângulo
            }
        }
    }()
}

/// Enumeração representando os formatos de confete disponíveis.
public enum ConfettiShape {
    case circle
    case rectangle
    case triangle
    
    /// Lista de todos os formatos disponíveis.
    static var allCases: [ConfettiShape] {
        [.circle, .rectangle, .triangle]
    }
}

/// Enumeração representando as posições possíveis do confete na camada de exibição.
public enum ConfettiPosition {
    case foreground
    case background
    
    /// Lista de todas as posições disponíveis.
    static var allCases: [ConfettiPosition] {
        [.foreground, .background]
    }
}
