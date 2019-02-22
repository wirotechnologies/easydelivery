//
//  images.swift
//  AppRestaurants
//
//  Created by Wilman Rojas on 11/13/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import Foundation
import UIKit


class ImageDownloadCaching {
    static let cache = NSCache<NSString, UIImage>()
    
    static func downloadImage(withURL url:URL, completion: @escaping (_ image:UIImage?)->()) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, responseURL, error in
            var downloadedImage:UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
            
        }
        
        dataTask.resume()
    }
    
    static func getImage(withURL url:URL, completion: @escaping (_ image:UIImage?)->()) {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
        } else {
            downloadImage(withURL: url, completion: completion)
        }
    }
    
    static func getBlockImage(data: [Dictionary<String,Any>], completion: @escaping (_ response:Bool?)->()) {
        
        var counter: Int = data.count
        for element in data {
            let file_name : String = element["image_file"] as! String
            let server: String = Config.server as String + file_name
            let url =  URL(string: server )!
            if cache.object(forKey: url.absoluteString as NSString) != nil {
                counter -= 1
                if counter == 0 {
                    completion(true)
                }
            } else {
                downloadImage(withURL: url) { (image) in
                    counter -= 1
                    if counter == 0 {
                        completion(true)
                    }
                }
            }
        }
    }
    
    
}
