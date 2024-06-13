//
//  File.swift
//  
//
//  Created by Gabriel Sanzone on 13/06/24.
//

import Foundation


public struct ViaCepModel: Codable {
    let cep, logradouro, complemento, bairro: String?
    let localidade, uf, ibge, gia: String?
    let ddd, siafi: String?
}

public class ViaCepManager {
    
    func request(cep: String, completion: @escaping (ViaCepModel?, Error?) -> Void) {
        let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(nil, error)
                return
            }
            
            do {
                let viaCep = try JSONDecoder().decode(ViaCepModel.self, from: data)
                completion(viaCep, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
