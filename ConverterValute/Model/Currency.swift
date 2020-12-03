//
//  Currency.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 29.11.2020.
//
import Foundation

struct Currency: Codable, Equatable {
    
    var name: String
    var charCode: String
    var nominal: Int
    var value: Double
    
    init() {
        name = "Российский рубль"
        charCode = "RUB"
        nominal = 1
        value = 1.0
    }
    
    init(dictionary: Dictionary<String, Any>) {
        name = dictionary["Name"] as? String ?? ""
        charCode = dictionary["CharCode"] as? String ?? ""
        nominal = dictionary["Nominal"] as? Int ?? 0
        value = dictionary["Previous"] as? Double ?? 0.0
    }
}
