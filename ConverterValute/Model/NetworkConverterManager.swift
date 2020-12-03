//
//  NetworkConverterManager.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 29.11.2020.
//

import Foundation

struct NetworkConverterManager {
    
    func fetchCurrency(comletionHandler: @escaping ([Currency]) -> Void) {
        let URLCurrencies = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: URLCurrencies) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(String(describing : error))
                return
            }
            
            if var currency = self.parseJSON(withData: data) {
                currency = currency.sorted(by: {$0.name < $1.name})
                comletionHandler(currency)
            }
        }
            task.resume()
    }
    
    func parseJSON(withData data: Data?) -> [Currency]?  {
        if data == nil {
            return nil
        }
        
        let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, Any>
        if rootDictionaryAny == nil {
            return nil
        }
        
        if let array = rootDictionaryAny!["Valute"] as? Dictionary<String, Any> {
            
            var returnValutes: [Currency] = []
            returnValutes.append(Currency())
            
            for dict in array {
                let newValute = Currency(dictionary: dict.value as! Dictionary<String, Any>)
                returnValutes.append(newValute)
            }
            return returnValutes
        }
        return nil
    }
}
