//
//  ConfettiView.swift
//  SwiftUI Confetti
//
//  Created by Gabriel Sanzone on 15/02/25.
//


import SwiftUI

/// UIViewRepresentable que representa a animação de confetes.
public struct ConfettiView: UIViewRepresentable {

    /// Estado que define se a animação está ativa.
    @Binding var isAnimating: Bool
    
    public init(isAnimating: Bool) {
        self.isAnimating = isAnimating
    }
    

    public func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    public func makeUIView(context: Context) -> UIView {
        // Cria uma instância de UIView, que será retornada pela função.
        let view = UIView()
        
        // Cria uma instância de CAEmitterLayer, que será responsável pelo efeito de partículas.
        let emitterLayer = CAEmitterLayer()
        
        // Configura a posição inicial do emissor de partículas na tela (na parte superior centralizada).
        emitterLayer.emitterPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: -50)
        
        // Configura o tamanho do emissor (na largura da tela, com altura bem pequena).
        emitterLayer.emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 2)
        
        // Define a forma do emissor como uma linha (os pontos de emissão serão dispostos em uma linha reta).
        emitterLayer.emitterShape = .line
        
        // Define a taxa de nascimento das partículas (começa com 0, ou seja, o emissor está desativado inicialmente).
        emitterLayer.birthRate = 0
        
        // Adiciona o emitterLayer como uma subcamada da view, para que o efeito de partículas seja exibido.
        view.layer.addSublayer(emitterLayer)
        
        // Atribui o emitterLayer ao coordenador para acesso posterior (caso seja necessário manipular o emissor em outras partes do código).
        context.coordinator.emitterLayer = emitterLayer
        
        // Retorna a view criada, que contém o emissor de partículas.
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        guard let emitterLayer = context.coordinator.emitterLayer else { return }

        if isAnimating {
            emitterLayer.birthRate = 1
            emitterLayer.emitterCells = generateConfettiCells()
        } else {
            emitterLayer.birthRate = 0
        }
    }
    
    /// Gera células de confete com cores variadas e diferentes propriedades visuais.
    public func generateConfettiCells() -> [CAEmitterCell] {
        let colors: [UIColor] = [.red, .green, .blue, .purple, .yellow, .orange, .cyan, .magenta]

        return colors.map { color in
            let cell = CAEmitterCell()
            
            // Define a imagem do confete com base na cor
            cell.contents = createConfettiImage(color: color)?.cgImage
            
            // Taxa de nascimento dos confetes
            cell.birthRate = 10
            
            // Tempo de vida do confete na tela (em segundos)
            cell.lifetime = 5
            
            // Velocidade do confete
            cell.velocity = CGFloat.random(in: 100...200)
            
            // Direção inicial dos confetes (para baixo)
            cell.emissionLongitude = .pi
            
            // Variação no ângulo de emissão dos confetes
            cell.emissionRange = .pi / 4
            
            // Gira os confetes ao cair
            cell.spin = CGFloat.random(in: -1...1)
            
            // Variação na rotação dos confetes
            cell.spinRange = 1
            
            // Tamanho inicial dos confetes
            cell.scale = 0.6
            
            // Variação no tamanho dos confetes
            cell.scaleRange = 0.3
            
            // Aceleração dos confetes na direção Y (simula gravidade)
            cell.yAcceleration = 100
            
            return cell
        }
    }
    
    /// Cria uma imagem de confete colorido.
    public func createConfettiImage(color: UIColor) -> UIImage? {
        // Define o tamanho da imagem a ser criada (10x10 pixels).
        let size = CGSize(width: 10, height: 10)
        
        // Inicia um contexto gráfico com o tamanho especificado.
        UIGraphicsBeginImageContext(size)
        
        // Verifica se o contexto gráfico foi criado com sucesso.
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // Define a cor de preenchimento com a cor fornecida como parâmetro.
        context.setFillColor(color.cgColor)
        
        // Preenche o retângulo com a cor definida, criando o "confete".
        context.fill(CGRect(origin: .zero, size: size))
        
        // Obtém a imagem gerada a partir do contexto gráfico.
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // Finaliza o contexto gráfico.
        UIGraphicsEndImageContext()
        
        // Retorna a imagem criada.
        return image
    }
    
    /// Coordenador para manipular a camada de partículas.
    public class Coordinator {
        var emitterLayer: CAEmitterLayer?
    }
}
