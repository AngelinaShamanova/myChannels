//
//  ArrayOfChannels.swift
//  myChannels
//
//  Created by MacBook on 20/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import Foundation

class ArrayOfChannels {
    
    var channels = ["CNN", "USA Today", "Space.com", "Eonline.com", "Bleacher Report", "CinemaBlend", "CBS News", "NPR", "New York Post", "MarketWatch", "The Wall Street Journal", "Us Weekly", "Fox News", "Ars Technica", "syracuse.com"]
    
    let descriptionOfChannel = ["CNN (Cable News Network) is an American news-based pay television channel owned by CNN Worldwide, a unit of the WarnerMedia News & Sports division of AT&T's WarnerMedia.",
                                
                                "USA Today is an internationally distributed American daily middle-market newspaper that is the flagship publication of its owner, Gannett.",
                                "Space.com is a web site featuring original space and astronomy news. Its Alexa rank is approximately 3000, and its stories are often syndicated to other media outlets.",
                                "Your source for entertainment news, celebrities, celeb news, and celebrity gossip. Check out the hottest fashion, photos, movies and TV shows!",
                                "Often abbreviated as B/R. Is a website that focuses on sport and sports culture. Its headquarters are in San Francisco, with offices in New York City and London.",
                                "CINEMABLEND is the go-to-source for today's information and updates on new movies, tv shows, games and celebrity news and gossip.",
                                "CBS News is the news division of American television and radio service CBS.",
                                "National Public Radio (NPR, stylized as npr) is an American privately and publicly funded non-profit media organization based in Washington, D.C.",
                                "Abbreviated as NY Post. Is a daily newspaper in New York City. The Post also operates NYPost.com, the celebrity gossip site PageSix.com and the entertainment site Decider.com.",
                                "MarketWatch is a website that provides financial information, business news, analysis, and stock market data.",
                                "The Wall Street Journal (known as The Journal) is an American business-focused, English-language international daily newspaper based in New York City, with international editions also available in Chinese and Japanese.",
                                "Us Weekly is a weekly celebrity and entertainment magazine based in New York City. Us Weekly was founded in 1977 by The New York Times Company, who sold it in 1980. ",
                                "Officially Fox News Channel, abbreviated FNC and commonly known as Fox. Is an American pay television conservative cable television news channel.",
                                "Ars Technica is a website covering news and opinions in technology, science, politics, and society, created by Ken Fisher and Jon Stokes in 1998.",
                                "Get the latest Syracuse, NY local news, sports news & US breaking news."]
    
    let channelsUrl = [
        "http://newsapi.org/v2/everything?domains=cnn.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        
        "http://newsapi.org/v2/everything?domains=usatoday.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=space.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=eonline.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=bleacherreport.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=cinemablend.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=cbsnews.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=npr.org&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=nypost.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=marketwatch.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=wsj.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=usmagazine.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=foxnews.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=arstechnica.com&apiKey=340a3e652a6a4e7bb3537f611303cc29",
        "http://newsapi.org/v2/everything?domains=syracuse.com&apiKey=340a3e652a6a4e7bb3537f611303cc29"
    ]
    
}
