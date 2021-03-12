//
//  Uitls.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import CryptoSwift

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
        let publicApiKey = "96883215ffa72a3c8dfa23e3883f6866"
        let privateApiKey = "9d1a45359c89f37c4e2d5a0ee6d826572624e785"
        let baseAPIURL = "https://gateway.marvel.com/v1/public"
        let urlSession = URLSession.shared
        let jsonDecoder = Utils.jsonDecoder
    }
 
}

class Helpers {
    
    //MARK: - GET TIMESTAMP
    func getTimeStamp() -> String{
        let xData = Int(round(Date().timeIntervalSince1970))
        return "\(xData)"
    }
    
    //MARK: - GET HASH
    func getHash() -> String{
        let pTimeStamp = self.getTimeStamp()
        let hash = (pTimeStamp+Utils.BaseURL().privateApiKey+Utils.BaseURL().publicApiKey).md5()
        return hash
    }
}


