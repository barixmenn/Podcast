//
//  FavoriteCell.swift
//  Podcast
//
//  Created by Baris on 19.05.2023.
//

import UIKit
import Kingfisher
class FavoriteCell: UICollectionViewCell {
     // MARK: - UI Elements
    private let podcastImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    private let podcastNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Podcast Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    private let podcastArtistNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Podcast Artist Name"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    private var fullStackView: UIStackView!
    
    //MARK: - Properties
    var podcastCoreData: PodcastCoreData?{
           didSet{ configure() }
       }
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}
 // MARK: - Helpers
extension FavoriteCell{
    private func style(){
        fullStackView = UIStackView(arrangedSubviews: [podcastImageView, podcastNameLabel, podcastArtistNameLabel])
        fullStackView.axis = .vertical
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            podcastImageView.heightAnchor.constraint(equalTo: podcastImageView.widthAnchor),
            
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    private func configure(){
           guard let podcastCoreData = self.podcastCoreData else { return }
           let viewModel = FavoriteViewModel(podcastCoreData: podcastCoreData)
           self.podcastImageView.kf.setImage(with: viewModel.imageUrlPodcast)
           self.podcastNameLabel.text = viewModel.podcastNameLabel
           self.podcastArtistNameLabel.text = viewModel.podcastArtistName
       }

}
