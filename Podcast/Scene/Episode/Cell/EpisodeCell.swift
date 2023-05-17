//
//  EpisodeCell.swift
//  Podcast
//
//  Created by Baris on 17.05.2023.
//

import Foundation
import UIKit

class EpisodeCell: UITableViewCell {
    
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
        backgroundColor = .blue
    }
    
    private func layout() {
        
    }
}
