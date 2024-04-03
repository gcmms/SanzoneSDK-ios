//
//  UserDefaultsManager.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 03/04/24.
//

import Foundation

// Protocolo para gerenciar operações no UserDefaults
public protocol UserDefaultsManagerInterface: AnyObject {
    // Define um valor para a chave especificada
    func setValue(value: Any, key: String)

    // Recupera o valor associado à chave especificada
    func getValue(key: String) -> Any?

    // Recupera uma string associada à chave especificada
    func getValueString(key: String) -> String?

    // Recupera um valor inteiro associado à chave especificada
    func getValueInt(key: String) -> Int?

    // Recupera um valor decimal associado à chave especificada
    func getValueDouble(key: String) -> Double?

    // Recupera um valor booleano associado à chave especificada
    func getValueBool(key: String) -> Bool?

    // Recupera uma matriz de valores associada à chave especificada
    func getValueArray<T>(key: String, type: T.Type) -> [T]
}

public class UserDefaultsManager: UserDefaultsManagerInterface {
    // Instância padrão de UserDefaults
    let defaults = UserDefaults.standard

    public init() { }

    // Define um valor para a chave especificada no UserDefaults
    public func setValue(value: Any, key: String) {
        defaults.set(value, forKey: key)
    }

    // Recupera o valor associado à chave especificada no UserDefaults
    public func getValue(key: String) -> Any? {
        return defaults.object(forKey: key)
    }

    // Recupera uma string associada à chave especificada no UserDefaults
    public func getValueString(key: String) -> String? {
        return defaults.string(forKey: key)
    }

    // Recupera um valor inteiro associado à chave especificada no UserDefaults
    public func getValueInt(key: String) -> Int? {
        return defaults.integer(forKey: key)
    }

    // Recupera um valor decimal associado à chave especificada no UserDefaults
    public func getValueDouble(key: String) -> Double? {
        return defaults.double(forKey: key)
    }

    // Recupera um valor booleano associado à chave especificada no UserDefaults
    public func getValueBool(key: String) -> Bool? {
        return defaults.bool(forKey: key)
    }

    // Recupera uma matriz de valores do tipo especificado associada à chave especificada no UserDefaults
    public func getValueArray<T>(key: String, type: T.Type) -> [T] {
        let result = defaults.array(forKey: key) as? [T]
        return result ?? [T]()
    }
}

