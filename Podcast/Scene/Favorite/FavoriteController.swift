//
//  FavoriteController.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation
import UIKit

private let reuseIdentifier = "SearchCell"
class FavoriteController: UICollectionViewController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    private var resultCoreDataItems: [PodcastCoreData] = []{
           didSet{ collectionView.reloadData() }
       }
    
    //MARK: - Lifecycle
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let mainTabController = window.keyWindow?.rootViewController as! MainTabController
        mainTabController.viewControllers?[0].tabBarItem.badgeValue = nil
        fetchData()
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    

    private func fetchData(){
           let fetchRequest = PodcastCoreData.fetchRequest()
           CoreDataController.fetchCoreData(fetchRequest: fetchRequest) { result in
               self.resultCoreDataItems = result
           }
       }
    
    //MARK: - Actions
    
}
//MARK: - Helpers
extension FavoriteController {
    private func style() {
        self.collectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func layout() {
        
    }
}

//MARK: - UICollectionViewDstaSource
extension FavoriteController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultCoreDataItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoriteCell
        cell.podcastCoreData = self.resultCoreDataItems[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let podcastCoreData = self.resultCoreDataItems[indexPath.row]
        let podcast = Podcast(trackName: podcastCoreData.trackName, artistName: podcastCoreData.artistName!, artworkUrl600: podcastCoreData.artworkUrl600, feedUrl: podcastCoreData.feedUrl)
        let controller = EpisodeController(podcast: podcast)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: -UICollectionFlowLayout
extension FavoriteController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 30) / 2
        return .init(width: width, height: width + 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
}
