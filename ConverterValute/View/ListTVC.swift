//
//  ListTVC.swift
//  ConverterValute
//
//  Created by Дмитрий Рудаков on 29.11.2020.
//

import UIKit


class ListTVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    @IBAction func pressCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyLoad.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell
        
        var currency = Currency()
        currency = currencyLoad[indexPath.row]
        cell.configure(currency: currency)
        printCheckMark(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if buttonLeftEditValute {
            currencyLeft = currencyLoad[indexPath.row]
        } else if buttonRightEditValute {
            currencyRight = currencyLoad[indexPath.row]
        }
        
        self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.dismiss(animated: true)
    }
    
    func printCheckMark (cell: ListCell, indexPath : IndexPath) {
        var cellCheckmarked = [Bool]()
        
        if buttonLeftEditValute {
            cellCheckmarked = cell.returnArrayCheckmark(currencyIn: currencyLeft)
        } else if buttonRightEditValute {
            cellCheckmarked = cell.returnArrayCheckmark(currencyIn: currencyRight)
        }
        
        if cellCheckmarked[indexPath.row] == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

