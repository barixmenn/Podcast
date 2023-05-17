//
//  EpisodeCell.swift
//  Podcast
//
//  Created by Baris on 17.05.2023.
//

import Foundation
import UIKit
import Kingfisher

class EpisodeCell: UITableViewCell {
    
    
    //MARK: - UI Elements
    private let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private let pubDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPurple
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "pubDateLabel"
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "titleLabel"
        label.numberOfLines = 2
        return label
    }()
    private let decriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.text = "decriptionLabel"
        return label
    }()
    private var stackView = UIStackView()
    
    //MARK: - Properties
    var episode : Episode? {
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
extension EpisodeCell {
    private func style() {
        addSubview(episodeImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(pubDateLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(decriptionLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            episodeImageView.heightAnchor.constraint(equalToConstant: 100),
            episodeImageView.widthAnchor.constraint(equalToConstant: 100),
            episodeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            episodeImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: episodeImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: episodeImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
            
        ])
    }
    
    private func configure() {
        
        guard let episode = self.episode else { return }
        let viewModel = EpisodeViewModel(episode: episode)
        self.episodeImageView.kf.setImage(with: viewModel.profileImageUrl)
        self.titleLabel.text = viewModel.title
        self.decriptionLabel.text = viewModel.description
        self.pubDateLabel.text = viewModel.pubDate
        
    }
}
