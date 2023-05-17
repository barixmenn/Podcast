//
//  EpisodeController.swift
//  Podcast
//
//  Created by Baris on 17.05.2023.
//

import Foundation
import UIKit

private let reuseIdentifier = "EpisodeCell"
class EpisodeController: UITableViewController {
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
extension EpisodeController {
    private func style() {
        self.tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
    private func layout() {
        
    }
}

//MARK: - UITableViewDataSoruce
extension EpisodeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EpisodeCell
        return cell
    }
}
