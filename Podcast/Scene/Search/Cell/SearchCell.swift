//
//  SearchCell.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation
import UIKit
import Kingfisher

class SearchCell : UITableViewCell {
    
//MARK: - UI Elements
    private let podcastImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        return image
    }()
    
    private let podcastName: UILabel = {
        let label = UILabel()
        label.text =  "Podcast name"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    private let podcastArtist: UILabel = {
        let label = UILabel()
        label.text =  "Podcast artist"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private let podcastCount: UILabel = {
        let label = UILabel()
        label.text =  "Podcast count"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private var stackView = UIStackView()
    
//MARK: - Properties
    var result   : Podcast? {
        didSet { configure() }
    }
    
//MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        style()
        layout()
    }
}

//MARK: - Helpers
extension SearchCell {
    
    private func style() {
        addSubview(stackView)
        addSubview(podcastImage)
        stackView.addArrangedSubview(podcastName)
        stackView.addArrangedSubview(podcastArtist)
        stackView.addArrangedSubview(podcastCount)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            podcastImage.heightAnchor.constraint(equalToConstant: 80),
            podcastImage.widthAnchor.constraint(equalToConstant: 80),
            podcastImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            podcastImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            stackView.centerYAnchor.constraint(equalTo: podcastImage.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: podcastImage.trailingAnchor,constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configure(){
           guard let result = self.result else { return }
           let viewModel = SearchViewModel(podcast: result)
           podcastName.text = viewModel.trackName
           podcastCount.text = viewModel.trackCountString
           podcastArtist.text = viewModel.artistName
           podcastImage.kf.setImage(with: viewModel.photoImageUrl)
       }
}
    
    
