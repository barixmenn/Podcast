//
//  PlayerController.swift
//  Podcast
//
//  Created by Baris on 18.05.2023.
//

import Foundation
import UIKit

class PlayerController: UIViewController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    var episode: Episode
    init(episode: Episode) {
        self.episode = episode
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
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension PlayerController {
    private func style() {
        view.backgroundColor = .red
        print(episode.title)
    }
    
    private func layout() {
        
    }
}
