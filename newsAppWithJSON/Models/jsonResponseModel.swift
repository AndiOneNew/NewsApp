//
//  jsonResponseModel.swift
//  newsAppWithJSON
//
//  Created by Илья Новиков on 14.04.2022.
//

import Foundation
import UIKit

public struct jsonResponseModel: Decodable {
    
    var status: String
    var totalResults: Int
    var articles: [articlesContents]
}

struct articlesContents: Decodable {
    
    var author: String?
    var title: String
    var description: String
    var urlToImage : String?
    var publishedAt: String
    var url: String
    
    func dateFormated( dateString : String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd'T'HH:mm:ss'Z'"
        let publishedData = formatter.date(from: dateString)
        formatter.dateFormat = "YYYY.MM.dd HH:mm"
        let formattedDate = formatter.string(from: publishedData!)
        return formattedDate
    }
}
