//
//  StringProtocol.swift
//  Start.Football
//
//  Created by Vitalii Sosin on 24.01.2021.
//

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).uppercased()  + dropFirst()
    }
    var firstCapitalized: String {
        return prefix(1).capitalized + dropFirst()
    }
}
