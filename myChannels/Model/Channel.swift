//
//  Channel.swift
//  myChannels
//
//  Created by MacBook on 18/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import Foundation

struct News: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    var title: String
    var description: String?
    var urlToImage: String?
    var source: Source
}

struct Source: Decodable {
    var name: String
}
