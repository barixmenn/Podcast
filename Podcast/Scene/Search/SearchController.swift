//
//  SearchController.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation
import UIKit
import Alamofire


private let reuseIdentifier = "SearchCell"

class SearchController: UITableViewController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    var searchResult : [Podcast] = [] {
        didSet { tableView.reloadData()}
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension SearchController {
    private func style() {
        self.tableView.register(SearchCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 130
        self.title = "Search"
        let searchContoller = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchContoller
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchContoller.searchBar.delegate = self
    }
    
    private func layout() {
        
    }

    
}

//MARK: - UITableViewDataSource
extension SearchController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count   
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        cell.result = searchResult[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = EpisodeController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

//MARK: - SearchDelegate
extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchService.fetchData(searchText: searchText) { result in
            print(result)
            self.searchResult = result
        }
    }
}
