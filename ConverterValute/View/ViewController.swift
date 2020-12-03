//
//  ViewController.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 29.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchCurrency(comletionHandler: @escaping (Currency) -> Void) {
        let URLCurrencies = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: URLCurrencies) else {return}
        
        /*var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"*/
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(String(describing : error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            /*if let weather = self.parseJSON(withData: data) {
                comletionHandler(weather)
            }*/
        }
        task.resume()
    }


}

