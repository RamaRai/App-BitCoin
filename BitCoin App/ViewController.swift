//
//  ViewController.swift
//  BitCoin App
//
//  Created by user152991 on 5/13/19.
//  Copyright © 2019 RamaRai. All rights reserved
//

import UIKit

//Picker View Data Source and Delegate

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource ,downloaderDelegate {
    func downlaoderDidFinishWithVlaue(value: Double) {
        valueLable.text = "\(value)"
    }
    

   var myDownloader = downloader()

    //Fixed list of counbtry availabe at the specified url
    let currencyList = ["JPY", "CNY", "SDG", "RON", "MKD", "MXN", "CAD", "ZAR", "AUD", "NOK", "ILS", "ISK", "SYP", "LYD", "UYU", "YER", "CSD",
                       "EEK", "THB", "IDR", "LBP", "AED", "BOB", "QAR", "BHD", "HNL", "HRK",
                       "COP", "ALL", "DKK", "MYR", "SEK", "RSD", "BGN", "DOP", "KRW", "LVL",
                       "VEF", "CZK", "TND", "KWD", "VND", "JOD", "NZD", "PAB", "CLP", "PEN",
                       "GBP", "DZD", "CHF", "RUB", "UAH", "ARS", "SAR", "EGP", "INR", "PYG",
                       "TWD", "TRY", "BAM", "OMR", "SGD", "MAD", "BYR", "NIO", "HKD", "LTL",
                       "SKK", "GTQ", "BRL", "EUR", "HUF", "IQD", "CRC", "PHP", "SVC", "PLN",
                       "USD"]
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var valueLable: UILabel!
    @IBOutlet weak var curPicker: UIPickerView!
    
    //Initial View self is delegat to initial view
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.valueLable.text = ""
        myDownloader.delegate = self
    }
    
    //Mandatory method - Number of Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Mandatory method - Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyList.count
    }
    
    //Mandatory method - title for rows
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyList[row]
    }

    //Action to be done when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // downloader object
        // step 1 
         myDownloader.getCurValue(currency: currencyList[row])
       
        
    }
    
}

