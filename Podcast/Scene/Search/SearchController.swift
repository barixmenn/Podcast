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
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        return cell
    }
}

//MARK: - SearchDelegate
extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchService.fetchData(searchText: searchText)
    }
}
