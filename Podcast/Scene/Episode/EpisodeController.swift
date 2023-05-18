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
    
    private var episodeResult : [Episode] = [] {
        didSet { self.tableView.reloadData() }
    }
    
    private var podcast: Podcast
    init(podcast: Podcast) {
        self.podcast = podcast
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        fetchData()
    }
    
    //MARK: - Actions
    
}

//MARK: - Service
extension EpisodeController {
    fileprivate func fetchData() {
        EpisodeService.fetchEpisodeData(urlString: self.podcast.feedUrl!) { result in
            DispatchQueue.main.async {
                self.episodeResult = result
            }
        }
    }
}


//MARK: - Helpers
extension EpisodeController {
    private func style() {
        self.navigationItem.title = podcast.trackName
        self.tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
    private func layout() {
        
    }
}

//MARK: - UITableViewDataSoruce
extension EpisodeController {
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

extension EpisodeController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = self.episodeResult[indexPath.item]
        let controller = PlayerController(episode: episode)
        self.present(controller, animated: true)
        
    }
}
