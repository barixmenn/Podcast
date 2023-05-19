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
    
    private var isFavorite : Bool = false {
        didSet { setupNavigationBar() }
    }
    
    private var resultCoreDataItems: [PodcastCoreData] = []{
        didSet{
            let isValue = resultCoreDataItems.contains(where: {$0.feedUrl == self.podcast.feedUrl})
            if isValue{
                isFavorite = true
            }else{
                isFavorite = false
            }
        }
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    init(podcast: Podcast) {
        self.podcast = podcast
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
        fetchData()
        fetchCoreData()
    }
    
    private func fetchCoreData(){
        let fetchRequest = PodcastCoreData.fetchRequest()
        CoreDataController.fetchCoreData(fetchRequest: fetchRequest) { result in
            self.resultCoreDataItems = result
        }
        
    }
    
    private func deleteCoreData(){
        CoreDataController.deleteCoreData(array: resultCoreDataItems, podcast: self.podcast)
        self.isFavorite = false
    }
    
    private func addCoreData(){
        let model = PodcastCoreData(context: context)
        model.feedUrl = self.podcast.feedUrl
        model.artworkUrl600 = self.podcast.artworkUrl600
        model.artistName = self.podcast.artistName
        model.trackName = self.podcast.trackName
        appDelegate.saveContext()
        isFavorite = true
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let mainTabController = window.keyWindow?.rootViewController as! MainTabController
        mainTabController.viewControllers?[0].tabBarItem.badgeValue = "New"
    }
    
    //MARK: - Function
    private func setupNavigationBar() {
        if isFavorite {
            let navigationButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(handleFavoriteButton))
            self.navigationItem.rightBarButtonItem = navigationButton
        } else {
            let navigationButton = UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(.red, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(handleFavoriteButton))
            self.navigationItem.rightBarButtonItem = navigationButton
        }
    }
    
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

//MARK: - Selector
extension EpisodeController {
    @objc func handleFavoriteButton(_ sender : UIBarButtonItem) {
        if isFavorite{
            deleteCoreData()
        }else{
            addCoreData()
        }
    }
}



//MARK: - Helpers
extension EpisodeController {
    private func style() {
        self.navigationItem.title = podcast.trackName
        self.tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        setupNavigationBar()
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
