//
//  Menus.swift
//  AppRestaurants
//
//  Created by Wilman Rojas on 11/11/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import Foundation
import UIKit

class Menus {
    
    
    
    //static func Serialise
    
    static func getVersion(data: Data) -> String{
        var version : String = ""
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String,Any>
        version = json!["version"] as! String
        return version
    }
    
    static func getObjects(data: Data) -> [Dictionary<String,Any>]{
        
        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! Dictionary<String,Any>
        let data  = json!["data"] as! [Dictionary<String,Any>]
        return data
    }
    
    static func getMenu( completionHandler: @escaping (Data) -> () )
    {
        var task: URLSessionDataTask?
        let errorData: Data = Data.init()
        let url =  URL(string: Config.server + "Api/menu")
        let session = URLSession(configuration: .default)
        task = session.dataTask(with: url!){
            data, response, error in
            guard let data = data, error == nil else {return}
            do{
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{
                        completionHandler(data)
                    }
                    else{
                        completionHandler(errorData)
                    }
                }
            }
        }
        task?.resume()
    }
    
    static func loadViewMenu(indice: NSArray)
    {
        print(indice)
    }
}


