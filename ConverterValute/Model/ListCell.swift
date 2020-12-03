//
//  ListCell.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 30.11.2020.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet var nameCurrencyLabel: UILabel!
    @IBOutlet var shortNameLabel: UILabel!
    
    func configure(currency: Currency) {
        self.nameCurrencyLabel.text = currency.name
        self.shortNameLabel.text = currency.charCode
    }
    
    func returnArrayCheckmark(currencyIn: Currency) -> [Bool] {
        var arrayIndexBool = [Bool]()
        
        for value in currencyLoad {
            if currencyIn.charCode == value.charCode {
                arrayIndexBool.append(true)
            } else {
                arrayIndexBool.append(false)
            }
        }
        return arrayIndexBool
    }
}

