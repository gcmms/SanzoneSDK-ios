//
//  UserDefaultsManager.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 03/04/24.
//

import Foundation

import Foundation

protocol KeychainManagerInterface {
    func saveToken(data: Data, key: String) -> Bool
    func getToken(key: String) -> String?
    func extrairTokenDoHeader(header: String?) -> String?
    func deleteToken(key: String)
}

class KeychainManager: KeychainManagerInterface {

    private let serviceName: String

    init(serviceName: String = "KeychainManager") {
        self.serviceName = serviceName
    }

    //data = "\(key):\(token)".data(using: .utf8)
    func saveToken(data: Data, key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
        return true
    }

    func getToken(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
        ]

        var data: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &data)

        if status == errSecSuccess, let retrievedData = data as? Data {
            let token =  String(data: retrievedData, encoding: .utf8)
            return extrairTokenDoHeader(header: token)
        } else {
            return nil
        }
    }

    func extrairTokenDoHeader(header: String?) -> String? {
        guard let header else { return nil }
        let components = header.components(separatedBy: ":")
        if components.count >= 2 {
            let token = components[1]
            let trimmedToken = token.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmedToken
        }
        return nil
    }

    func deleteToken(key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)
    }
}

