//
//  ChannelsViewController.swift
//  myChannels
//
//  Created by MacBook on 18/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

enum ChannelsNames: String, CaseIterable {
    case cnn = "CNN"
    case usaToday = "USA Today"
    case space = "Space.com"
    case eonline = "Eonline.com"
    case bleacherReport = "Bleacher Report"
    case cinemaBlend = "CinemaBlend"
    case cbsNews = "CBS News"
    case npr = "NPR"
    case newYorkPost = "New York Post"
    case marketWatch = "MarketWatch"
    case theWallStreetJournal = "The Wall Street Journal"
    case usWeekly = "Us Weekly"
    case foxNews = "Fox News"
    case arsTechnica = "Ars Technica"
    case syracuse = "syracuse.com"
}

class ChannelsViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let channelsNames = ChannelsNames.allCases
    
    // MARK: - Public Properties
    let realm = try! Realm()
    let networkService = NetworkService()
    let channels = ArrayOfChannels()
    var news: News? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(withUrl: "http://newsapi.org/v2/top-headlines?country=us&apiKey=340a3e652a6a4e7bb3537f611303cc29")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.channels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) 
        
        cell.textLabel?.text? = channelsNames[indexPath.row].rawValue
        cell.detailTextLabel?.text = channels.descriptionOfChannel[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @available(iOS 11.0, *)
    func addToFavorites(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "♥︎\n Add to favorites") { (_, _, _) in
            
            let favoriteChannel = FavoriteChannel()
            
            try! self.realm.write {
                favoriteChannel.nameOfChannel.append(contentsOf: self.channels.channels[indexPath.row])
                self.realm.add(favoriteChannel)
            }
        }
        return action
    }
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let _ = self.addToFavorites(at: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [addToFavorites(at: indexPath)])
        return swipe
    }
    
    func fetchData(withUrl url: String) {
        self.networkService.request(urlString: url) { [weak self] (news, error) in
            news?.articles.map({ (new) in
                self?.news = news
                self?.tableView.reloadData()
            })
        }
    }
    
}

