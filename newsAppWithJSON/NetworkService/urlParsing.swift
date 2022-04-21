//
//  urlParsing.swift
//  newsAppWithJSON
//
//  Created by Илья Новиков on 18.04.2022.
//

import Foundation
import UIKit

class ParsingData {
    
    let networkService = NetworkService()
    
    func parsingRequst(response: @escaping (jsonResponseModel?) -> Void) {
        networkService.jsonGet { (Result) in
            switch Result {
               
            case .success(let data):
                do {
                    print("start parsing")
                    let jsonResponseModel = try JSONDecoder().decode(jsonResponseModel.self, from: data)
                    response(jsonResponseModel)
                } catch let jsonError {
                    print("Failed converted JSON:",jsonError)
                }
            case .failure(let error):
                print("Error:",error)
            }
        }
    }
}
