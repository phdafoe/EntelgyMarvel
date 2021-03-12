//
//  Uitls.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    struct BaseURL {
        let apiKey = "69026ea9631206afda1b3e75a79381ee"
        let baseAPIURL = "https://gateway.marvel.com/v1/public/"
        let urlSession = URLSession.shared
        let jsonDecoder = Utils.jsonDecoder
    }
    
    
        
   
}


