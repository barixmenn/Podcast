//
//  MainTabController.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation
import UIKit

class MainTabController: UITabBarController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    //MARK: - Functions
    private func setup() {
        style()
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension MainTabController {
    private func style() {
        viewControllers = [
          createViewController(rootViewController: FavoriteController() , title: "Favorites", imagename: "play.circle.fill"),
          createViewController(rootViewController: SearchController(), title: "Search", imagename: "magnifyingglass"),
          createViewController(rootViewController: DownloadsController(), title: "Downloads", imagename: "square.stack.fill")
        ]
    }
    
    
        private func createViewController(rootViewController: UIViewController, title: String, imagename: String) -> UINavigationController{
                rootViewController.title = title
                let appearance = UINavigationBarAppearance()
                appearance.configureWithDefaultBackground()
                let controller = UINavigationController(rootViewController: rootViewController)
                controller.navigationBar.prefersLargeTitles = true
                controller.navigationBar.compactAppearance = appearance
                controller.navigationBar.standardAppearance = appearance
                controller.navigationBar.scrollEdgeAppearance = appearance
                controller.navigationBar.compactScrollEdgeAppearance = appearance
                controller.tabBarItem.title = title
                controller.tabBarItem.image = UIImage(systemName: imagename)
                return controller
            }
}
