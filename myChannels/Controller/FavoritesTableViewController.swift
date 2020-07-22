//
//  FavoritesTableViewController.swift
//  myChannels
//
//  Created by MacBook on 18/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

class FavoritesTableViewController: UITableViewController {
    
    // MARK: - Public Properties
    let realm = try! Realm()
    let networkService = NetworkService()
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
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.textLabel?.text == "CNN" {
            performSegue(withIdentifier: "CNN", sender: self)
        } else if cell?.textLabel?.text == "USA Today" {
            performSegue(withIdentifier: "USAToday", sender: self)
        } else if cell?.textLabel?.text == "Space.com" {
            performSegue(withIdentifier: "Space", sender: self)
        } else if cell?.textLabel?.text == "Eonline.com" {
            performSegue(withIdentifier: "Eonline", sender: self)
        } else if cell?.textLabel?.text == "Bleacher Report" {
            performSegue(withIdentifier: "BleacherReport", sender: self)
        } else if cell?.textLabel?.text == "CinemaBlend" {
            performSegue(withIdentifier: "CinemaBlend", sender: self)
        } else if cell?.textLabel?.text == "CBS News" {
            performSegue(withIdentifier: "CBSNews", sender: self)
        } else if cell?.textLabel?.text == "NPR" {
            performSegue(withIdentifier: "NPR", sender: self)
        } else if cell?.textLabel?.text == "New York Post" {
            performSegue(withIdentifier: "NewYorkPost", sender: self)
        } else if cell?.textLabel?.text == "MarketWatch" {
            performSegue(withIdentifier: "MarketWatch", sender: self)
        } else if cell?.textLabel?.text == "The Wall Street Journal" {
            performSegue(withIdentifier: "TheWallStreetJournal", sender: self)
        } else if cell?.textLabel?.text == "Us Weekly" {
            performSegue(withIdentifier: "UsWeekly", sender: self)
        } else if cell?.textLabel?.text == "Fox News" {
            performSegue(withIdentifier: "FoxNews", sender: self)
        } else if cell?.textLabel?.text == "Ars Technica" {
            performSegue(withIdentifier: "ArsTechnica", sender: self)
        } else if cell?.textLabel?.text == "syracuse.com" {
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
        
        tableView.reloadData()
    }
    
}
