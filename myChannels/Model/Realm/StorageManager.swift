//
//  StorageManager.swift
//  myChannels
//
//  Created by MacBook on 20/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class StorageManager {
    
    let networkService = NetworkService()
    var news: News? = nil
    
    func configure(with news: Article, _ url: String) {
        self.networkService.request(urlString: url) { [weak self] (news, error) in
            news?.articles.map({ (new) in
                self?.news = news
            })
        }
    }
    
}
