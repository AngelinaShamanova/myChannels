//
//  NewsViewController.swift
//  myChannels
//
//  Created by MacBook on 20/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift



class NewsViewController: UITableViewController {
    
    // MARK: - Public Properties
    let realm = try! Realm()
    let networkService = NetworkService()
    var news: News? = nil
    var favoritesChannels: Results<FavoriteChannel>!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesChannels = realm.objects(FavoriteChannel.self)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        
        guard let new = news?.articles[indexPath.row] else { return cell }
        cell.configure(with: new)
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
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
