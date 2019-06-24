//
//  JSONParser.swift
//  favorite-movies-app
//
//  Created by Kyle Morton on 6/24/19.
//  Copyright © 2019 Morton-Development. All rights reserved.
//

import Foundation

class JSONParser {
    
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options) as? [String: AnyObject]
            return json!
        } catch (let parseError) {
            print("Error parsing the JSON: \(parseError.localizedDescription)")
        }
        return nil
    }
    
}
