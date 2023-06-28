//
//  NewsTableViewCell.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 28/06/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet private weak var newsAuthorLabel: UILabel!
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with newsData: NewsCellData) {
        self.newsAuthorLabel.text = newsData.author != nil
        ? "By: " + (newsData.author ?? "No author")
        : "No author"
        
        self.newsTitleLabel.text = newsData.title
        
        if let imageURL = newsData.imageURL {
            let url = URL(string: imageURL)!
            DispatchQueue.global().async {
                guard let data = AlamofireNetworkManager.fetchImage(with: url) else { return }
                
                DispatchQueue.main.async {
                    self.newsImage.image = UIImage(data: data)
                }   
            }
        }   
    }
}
