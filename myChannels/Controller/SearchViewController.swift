//
//  SearchViewController.swift
//  myChannels
//
//  Created by MacBook on 21/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class SearchViewController: UITableViewController {
    
    // MARK: - Privater properties
    private var timer: Timer?
    
    // MARK: - Public properties
    let networkService = NetworkService()
    let urlNews = "http://newsapi.org/v2/top-headlines?country=us&apiKey=340a3e652a6a4e7bb3537f611303cc29"
    var news: News? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(withUrl: urlNews)
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
        
        
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

// MARK: - UISearchBarDelegate
@available(iOS 11.0, *)
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let urlString = "http://newsapi.org/v2/top-headlines?q=\(searchText)&country=us&apiKey=340a3e652a6a4e7bb3537f611303cc29"
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.fetchData(withUrl: urlString)
        })
    }
}
