//
//  UserDefaultsManagerTests.swift
//
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 03/04/24.
//

import Foundation
import XCTest
import SanzoneSDK

class UserDefaultsManagerTests: XCTestCase {

    var userDefaultsManager: UserDefaultsManager!

    override func setUp() {
        super.setUp()
        // Configuração inicial para cada teste
        userDefaultsManager = UserDefaultsManager()
    }

    override func tearDown() {
        // Limpeza após cada teste
        userDefaultsManager = nil
        super.tearDown()
    }

    func testSettingAndGettingValue() {
        // Definir um valor
        let key = "testValue"
        let value = "Test"
        userDefaultsManager.setValue(value: value, key: key)

        // Recuperar o valor e verificar se é igual ao valor definido
        XCTAssertEqual(userDefaultsManager.getValueString(key: key), value)
    }

    func testGettingNonexistentValue() {
        // Recuperar um valor que não existe
        let nonExistentKey = "nonExistentKey"
        XCTAssertNil(userDefaultsManager.getValue(key: nonExistentKey))
    }
}
