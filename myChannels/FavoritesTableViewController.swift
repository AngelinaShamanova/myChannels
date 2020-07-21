//
//  FavoritesTableViewController.swift
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

class FavoritesTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    
    private let channelsNames = ChannelsNames.allCases
    
    // MARK: - Public Properties
    
    let realm = try! Realm()
    let networkService = NetworkService()
    let channels = ArrayOfChannels()
    var news: News? = nil
    var favoritesChannels: Results<FavoriteChannel>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesChannels = realm.objects(FavoriteChannel.self)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesChannels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) 
        
        cell.textLabel?.text = favoritesChannels[indexPath.row].nameOfChannel
        cell.textLabel?.font = UIFont(name: "Copperplate", size: 20.0)
        cell.textLabel?.textColor = .white
        
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favChannels = self.favoritesChannels[indexPath.row]
            try! realm.write {
                realm.delete(favChannels)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func fetchData(withUrl url: String) {
        self.networkService.request(urlString: url) { [weak self] (news, error) in
            news?.articles.map({ (new) in
                self?.news = news
                self?.tableView.reloadData()
            })
        }
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channelNames = channelsNames[indexPath.item]
        
        switch channelNames {
        case .cnn:
            performSegue(withIdentifier: "CNN", sender: self)
        case .usaToday:
            performSegue(withIdentifier: "USAToday", sender: self)
        case .space:
            performSegue(withIdentifier: "Space", sender: self)
        case .eonline:
            performSegue(withIdentifier: "Eonline", sender: self)
        case .bleacherReport:
            performSegue(withIdentifier: "BleacherReport", sender: self)
        case .cinemaBlend:
            performSegue(withIdentifier: "CinemaBlend", sender: self)
        case .cbsNews:
            performSegue(withIdentifier: "CBSNews", sender: self)
        case .npr:
            performSegue(withIdentifier: "NPR", sender: self)
        case .newYorkPost:
            performSegue(withIdentifier: "NewYorkPost", sender: self)
        case .marketWatch:
            performSegue(withIdentifier: "MarketWatch", sender: self)
        case .theWallStreetJournal:
            performSegue(withIdentifier: "TheWallStreetJournal", sender: self)
        case .usWeekly:
            performSegue(withIdentifier: "UsWeekly", sender: self)
        case .foxNews:
            performSegue(withIdentifier: "FoxNews", sender: self)
        case .arsTechnica:
            performSegue(withIdentifier: "ArsTechnica", sender: self)
        case .syracuse:
            performSegue(withIdentifier: "syracuse", sender: self)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsVC = segue.destination as! NewsViewController
        
        switch segue.identifier {
        case "CNN":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=cnn.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "USAToday":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=usatoday.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "Space":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=space.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "Eonline":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=eonline.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "BleacherReport":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=bleacherreport.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "CinemaBlend":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=cinemablend.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "CBSNews":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=cbsnews.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "NPR":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=npr.org&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "NewYorkPost":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=nypost.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "MarketWatch":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=marketwatch.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "TheWallStreetJournal":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=wsj.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "UsWeekly":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=usmagazine.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "FoxNews":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=foxnews.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "ArsTechnica":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=arstechnica.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
        case "syracuse":
            newsVC.fetchData(withUrl: "http://newsapi.org/v2/everything?domains=syracuse.com&apiKey=340a3e652a6a4e7bb3537f611303cc29")
            
        default: break
        }
    }
    
}
