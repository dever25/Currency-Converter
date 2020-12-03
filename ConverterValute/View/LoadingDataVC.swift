//
//  LoadingDataVC.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 02.12.2020.
//

import UIKit

var currencyLoad = [Currency]()
class LoadingDataVC: UIViewController {
    
    let networkConverterManager = NetworkConverterManager()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.addCurrency()
     }

    override func viewDidAppear(_ animated:Bool) {
        DispatchQueue.global().sync {
            super.viewDidAppear(true)
            sleep(2)
        }
            let goConvertVC = self.storyboard?.instantiateViewController(withIdentifier: "goConvertVC") as! ConvertVC
            goConvertVC.modalPresentationStyle = .fullScreen
            self.present(goConvertVC, animated: true, completion: nil)
            return
        }

    func addCurrency() {
        networkConverterManager.fetchCurrency() { currencyArray in
            currencyLoad = currencyArray
        }
    }
}
