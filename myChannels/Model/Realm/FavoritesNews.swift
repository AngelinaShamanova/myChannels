//
//  FavoritesNews.swift
//  myChannels
//
//  Created by MacBook on 20/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import RealmSwift

class FavoritesNews: Object {
    @objc dynamic var nameOfChannel = ""
    @objc dynamic var titleOfNews = ""
    @objc dynamic var descriptionOfNews = ""
    @objc dynamic var urlToImage = ""
}
