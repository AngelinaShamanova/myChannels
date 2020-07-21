//
//  SearchCell.swift
//  myChannels
//
//  Created by MacBook on 21/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet var titleOfSearchNews: UILabel!
    @IBOutlet var detailOfSearchNews: UILabel!
    @IBOutlet var channelName: UILabel!
    @IBOutlet var imageOfSearchNews: UIImageView!
    
    func configure(with news: Article) {
        
        titleOfSearchNews.text = news.title
        titleOfSearchNews.numberOfLines = 3
        detailOfSearchNews.text = news.description
        detailOfSearchNews.numberOfLines = 2
        channelName.text = news.source.name
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: news.urlToImage ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageOfSearchNews.image = UIImage(data: imageData)
            }
        }
        
    }
}
