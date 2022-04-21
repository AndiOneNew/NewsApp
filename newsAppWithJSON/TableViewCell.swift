//
//  TableViewCell.swift
//  newsAppWithJSON
//
//  Created by Илья Новиков on 18.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageArticls: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(with model: articlesContents){
        imageArticls.loadImageFromURL(from: model.urlToImage!)
        authorLabel.text = model.author
        descriptionsLabel.text = model.description
        dateLabel.text = model.dateFormated(dateString: model.publishedAt)
        }
}
