//
//  urlResponseParsing.swift
//  newsAppWithJSON
//
//  Created by Илья Новиков on 16.04.2022.
//

import Foundation
import UIKit

class NetworkService {
    
    func jsonGet(completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-04-17&to=2022-04-17&sortBy=popularity&apiKey=15be721995714b4686b3dee7e5b4d243")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        task.resume()
    }
}

extension UIImageView {
    func loadImageFromURL(from urlString: String) {
        let url = URL(string: urlString) ?? URL(string: "https://1.bp.blogspot.com/--b7JV7PgDPo/Xj6jliViqZI/AAAAAAAAC60/NO3XtMYWHR00NPBc-a_wxlkszqLEB07QACLcBGAsYHQ/s1600/record.jpg")
        let requst = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: requst) { (data, response, error)  in
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
