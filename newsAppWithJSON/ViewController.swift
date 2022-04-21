//
//  ViewController.swift
//  newsAppWithJSON
//
//  Created by Илья Новиков on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let parsingGroup = DispatchGroup()
    var articles: jsonResponseModel? = nil
    let network = ParsingData()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        network.parsingRequst { (jsonResponseModel) in
            guard let jsonResponseModel = jsonResponseModel else { return }
            self.articles = jsonResponseModel
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.configureCell(with: (articles?.articles[indexPath.row ])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        webVC.url = self.articles?.articles[indexPath.item].url
        self.present(webVC, animated: true, completion: nil)
    }
}

