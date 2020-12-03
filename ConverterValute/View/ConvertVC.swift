//
//  ConvertVC.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 30.11.2020.
//

import UIKit

var buttonLeftEditValute =  false
var buttonRightEditValute = false

var currencyLeft =  Currency()
var currencyRight = Currency()


class ConvertVC: UIViewController {
    
    @IBOutlet var valueLeft:    UITextField!
    @IBOutlet var valueRight:   UITextField!
    
    @IBOutlet var nameLeftValue:    UILabel!
    @IBOutlet var nameRightValue:   UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLeftValue.text =    currencyLeft.charCode
        nameRightValue.text =   currencyRight.charCode
        
        if buttonLeftEditValute {
            enterRightValue((Any).self)
        } else if buttonRightEditValute {
            enterLeftValue((Any).self)
        }
    }
    
    @IBAction func changeLeftCurrency(_ sender: Any) {
        buttonLeftEditValute =  true
        buttonRightEditValute = false
    }
    
    @IBAction func changeRightCurrency(_ sender: Any) {
        buttonLeftEditValute =  false
        buttonRightEditValute = true
    }
    
    @IBAction func enterLeftValue(_ sender: Any) {
        valueRight.text = convertCurrency(enteredAmount: valueLeft.text!.doubleValue, boolLeftField: true)
    }
    
    @IBAction func enterRightValue(_ sender: Any) {
        valueLeft.text = convertCurrency(enteredAmount: valueRight.text!.doubleValue, boolLeftField: false)
    }
    
    func convertCurrency(enteredAmount : Double, boolLeftField: Bool) -> String {
        var equally: Double = 0.0
        if boolLeftField {
            equally = enteredAmount * currencyLeft.value / Double(currencyLeft.nominal) / currencyRight.value * Double (currencyRight.nominal)
        } else {
            equally = enteredAmount * currencyRight.value / Double(currencyRight.nominal) / currencyLeft.value * Double (currencyLeft.nominal)
        }
        
        return String(format:"%.2f", equally)
    }
}

extension String {
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}



