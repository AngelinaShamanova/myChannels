//
//  NewsCell.swift
//  myChannels
//
//  Created by MacBook on 20/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit



class NewsCell: UITableViewCell {
    
    @IBOutlet var imageOfNews: UIImageView!
    @IBOutlet var titleOfNews: UILabel!
    @IBOutlet var detailOfNews: UILabel!
    @IBOutlet var channelName: UILabel!
    
    
    func configure(with news: Article) {
        
        titleOfNews.text = news.title
        detailOfNews.text = news.description
        channelName.text = news.source.name
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: news.urlToImage ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageOfNews.image = UIImage(data: imageData)
            }
        }
        
    }
    
    
}
