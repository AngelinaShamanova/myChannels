//
//  ChannelsViewController.swift
//  myChannels
//
//  Created by MacBook on 18/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class ChannelsViewController: UITableViewController {
    
    let channels = ["CNN", "Google News", "USA Today", "Space.com", "Eonline.com", "Bleacher Report", "CinemaBlend", "CBS News", "NPR", "New York Post", "MarketWatch", "The Wall Street Journal", "Us Weekly", "Fox News", "Ars Technica", "syracuse.com", "Vikings Territory"]
    
    let descriptionOfChannel = ["CNN (Cable News Network) is an American news-based pay television channel owned by CNN Worldwide, a unit of the WarnerMedia News & Sports division of AT&T's WarnerMedia.",
        "Google News organizes the news to help you learn more about the stories that matter. Stay up-to-date on breaking news, world news, and the topics you care about most.",
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
        "Get the latest Syracuse, NY local news, sports news & US breaking news.",
        "VikingsTerritory is the leading local/independent resource for Minnesota Vikings News and content from and for fans! New articles daily!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) 
        
        cell.textLabel?.text? = channels[indexPath.row]
        cell.detailTextLabel?.text = descriptionOfChannel[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @available(iOS 11.0, *)
    func addToFavorites(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Add to favorites") { (_, _, _) in
            
        }
        return action
    }
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let _ = self.addToFavorites(at: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [addToFavorites(at: indexPath)])
        return swipe
    }
    
}

