//
//  Downloader.swift
//  BitCoin

//  Created by user152991 on 5/13/19.
//  Copyright © 2019 RamaRai. All rights reserved

//

import Foundation

//All methods in Protocol must be called if not optional
//To come back from current to previous any ViewController
//segue cannot help pass the data hence protocol is used
//segue can pass data only from current to forward direction
protocol downloaderDelegate {
    func downlaoderDidFinishWithVlaue(value : Double)
}

class downloader {
    
    var delegate : downloaderDelegate?
    
    //Function to actually get the BitCoin value
    //in seperate thread
    func getData(urlObject : URL , completionHandler : @escaping (Data)->())  {
        //step 3
        let config = URLSessionConfiguration.default
        let session = URLSession.init(configuration: config)
        
        let task = session.dataTask(with: urlObject) { (data, respons, error) in
            if let myData = data {
                //step 4
                completionHandler(myData)
            }
            else {
                print("error in downloadeing \(error)" )
            }
        }
        task.resume()
        
    }
    
    //Function to call site via url and country code to get the respective Bitcoin value
    //Passed parameter is country code
    
    func getCurValue(currency : String)  {
        //step 2
     let urlString =  "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"  + currency
       
        var thevalue : Double = 0
        //Converting string url to url object
        let urlObject : URL = URL(string: urlString)!
        //Call method passing url to get the data
        getData(urlObject: urlObject) { (data) in
            do{
                
                // stpe 5 Serialization of Json to have key value pair
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                 thevalue = json.value(forKey: "ask") as! Double
                //joining the main thread with data
                DispatchQueue.main.async {
                    self.delegate?.downlaoderDidFinishWithVlaue(value: thevalue)
                    
                }
                
                
            }catch{
                
            }
            
            
        }
      
        
    }
    
}
