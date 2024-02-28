//
//  String.swift
//  SanzoneSDK
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 10/01/24.
//

import Foundation
import UIKit

extension String {
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    var isValidFirstName: Bool {
        return trim().count >= 2
    }

    var isValidLastName: Bool {
        return trim().count >= 2
    }

    func validateCPFNumber() -> Bool {
        let cleanVatNumber = self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        let chars = Array(cleanVatNumber)

        if chars.count != 11 {
            return false
        }

        let strings: [String] = chars.compactMap { String($0) }
        let integerList = strings.compactMap { Int($0) }
        let set = Set(integerList)

        guard set.count > 1 else { return false }

        guard
            let num1 = integerList[safe: 0],
            let num2 = integerList[safe: 1],
            let num3 = integerList[safe: 2],
            let num4 = integerList[safe: 3],
            let num5 = integerList[safe: 4],
            let num6 = integerList[safe: 5],
            let num7 = integerList[safe: 6],
            let num8 = integerList[safe: 7],
            let num9 = integerList[safe: 8],
            let num10 = integerList[safe: 9],
            let num11 = integerList[safe: 10]
        else {
            return false
        }

        let sum1 = 11 - (num1 * 10 +
                         num2 * 9 +
                         num3 * 8 +
                         num4 * 7 +
                         num5 * 6 +
                         num6 * 5 +
                         num7 * 4 +
                         num8 * 3 +
                         num9 * 2) % 11

        let div1 = (sum1 > 9) ? 0 : sum1

        let sum2 = 11 - (num1 * 11 +
                          num2 * 10 +
                          num3 * 9 +
                          num4 * 8 +
                          num5 * 7 +
                          num6 * 6 +
                          num7 * 5 +
                          num8 * 4 +
                          num9 * 3 +
                          num10 * 2) % 11

        let dv2 = (sum2 > 9) ? 0 : sum2

        return div1 == num10 && dv2 == num11
    }

    enum TypeFormart: String {
        case cellPhone = "(##) ##### ####"
        case phone = "(##) #### ####"
        case rg = "##.###.###-#"
        case cpf = "###.###.###-##"
        case cep = "#####-###"
    }

    var isCPF: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }

        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }

        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }

    var isRG: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 9 else { return false }
        return true
    }

    var maskCPF: String {
        var cpf = self
        cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 3))
        cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 7))
        cpf.insert("-", at: cpf.index(cpf.startIndex, offsetBy: 11))

        return cpf
    }

    var maskRG: String {
        var cpf = self
        cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 2))
        cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 6))
        //cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 10))
        cpf.insert("-", at: cpf.index(cpf.startIndex, offsetBy: 10))

        return cpf
    }

    var isPhoneNumber: Bool {
        return isPhoneNumber(contValue: 10)
    }

    var isCellNumber: Bool {
        return isPhoneNumber(contValue: 11)
    }

    var isCep: Bool {
        return isPhoneNumber(contValue: 8)
    }

    private func isPhoneNumber(contValue: Int) -> Bool {
        let phoneNumberSet = CharacterSet(charactersIn: "+0123456789")
        if rangeOfCharacter(from: phoneNumberSet.inverted) != nil {
            return false
        } else if count != contValue {
            return false
        }
        return true
    }

    var maskPhone: String {
        if self.isEmpty {
            return self
        }
        var mask = self
        mask.insert("(", at: index(startIndex, offsetBy: 0))
        mask.insert(")", at: index(startIndex, offsetBy: 3))
        mask.insert("-", at: index(startIndex, offsetBy: 8))
        return mask
    }

    var toInt: Int? {
        return Int(self)
    }

    private func formattedNumber(number: String, mask: String = "## #### ####") -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "#" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    func formattedNumber(mask: TypeFormart) -> String {
        return formattedNumber(number: self, mask: mask.rawValue)
    }
}
