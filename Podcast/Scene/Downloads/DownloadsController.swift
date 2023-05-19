//
//  DownloadsController.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation
import UIKit


private let reuseIdentifier = "DownloadsCell"
class DownloadsController: UITableViewController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    private var episodeResult = UserDefaults.downloadEpisodeRead()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.episodeResult = UserDefaults.downloadEpisodeRead()
        self.tableView.reloadData()
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension DownloadsController {
    private func style() {
        self.tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func layout() {
        
    }
}

//MARK: - UITableViewDataSource
extension DownloadsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeResult.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EpisodeCell
        cell.episode = self.episodeResult[indexPath.row]
        return cell
    }
}
//MARK: - UITableViewDelegate
extension DownloadsController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PlayerController(episode: self.episodeResult[indexPath.row])
        self.present(controller, animated: true)
    }
}
