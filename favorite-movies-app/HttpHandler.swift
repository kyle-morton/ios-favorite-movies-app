//
//  HttpHandler.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/24/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import Foundation

class HttpHandler {
    
    static func getJson(urlString: String, completionHandler: @escaping (Data?) -> Void) {
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        
        print("URL being used is \(url)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
        
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                print("request completed w/ code: \(statusCode)")
                if (statusCode == 200) {
                    print("return to completion handler w/ the data...")
                    completionHandler(data as Data)
                }
                
            } else if let error = error {
                print("There was an error \(error)");
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
    
}
