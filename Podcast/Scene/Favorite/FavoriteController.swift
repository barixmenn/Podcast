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
    
    //MARK: - Life Cycle
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Functions
    private func setup() {
        style()
        layout()
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
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoriteCell
        return cell
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
