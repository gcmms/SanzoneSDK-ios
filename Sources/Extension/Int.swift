//
//  Int.swift
//  SanzoneSDK
//
//  Criado por Gabriel Chirico Mahtuk de Melo Sanzone em 23/01/24.
//

import Foundation

public extension Int {

    /// Retorna uma versão formatada do número como uma string, conforme especificado pela máscara fornecida.
    ///
    /// - Parameter mask: A máscara de formatação para aplicar ao número.
    /// - Returns: Uma string contendo o número formatado conforme a máscara fornecida.
    func formattedString(mask: String) -> String {
        // Transforma o número em uma string
        let numberString = String(self)

        // Conta o número de dígitos no número
        let numberOfDigits = numberString.count

        // Inicia uma string vazia para a versão formatada
        var formattedNumber = ""

        // Inicia um contador para rastrear o número de dígitos percorridos
        var digitCount = 0

        // Inicia um contador para rastrear o número de dígitos em um grupo
        var groupDigitCount = 0

        // Itera sobre os caracteres da máscara em ordem reversa
        for character in mask.reversed() {
            // Verifica se o caractere é um dígito ou uma vírgula
            if character == "#" {
                // Verifica se há dígitos restantes no número original
                if digitCount < numberOfDigits {
                    // Adiciona o próximo dígito do número original à versão formatada
                    formattedNumber.insert(numberString[numberString.index(numberString.startIndex, offsetBy: numberOfDigits - 1 - digitCount)], at: formattedNumber.startIndex)
                    // Incrementa o contador de dígitos
                    digitCount += 1
                    // Incrementa o contador de dígitos em um grupo
                    groupDigitCount += 1
                } else {
                    // Se não houver mais dígitos no número original, adiciona 0
                    formattedNumber.insert("0", at: formattedNumber.startIndex)
                }
            } else if character == "," {
                // Verifica se o grupo atual não está vazio
                if groupDigitCount > 0 {
                    // Adiciona uma vírgula ao grupo
                    formattedNumber.insert(",", at: formattedNumber.startIndex)
                }
                // Reinicia o contador de dígitos em um grupo
                groupDigitCount = 0
            } else {
                // Se o caractere não for um dígito ou uma vírgula, adiciona à versão formatada
                formattedNumber.insert(character, at: formattedNumber.startIndex)
            }
        }

        return formattedNumber
    }
}

