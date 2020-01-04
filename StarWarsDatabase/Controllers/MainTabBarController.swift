//
//  MainViewController.swift
//  StarWarsDatabase
//
//  Created by Joel Júnior on 03/01/20.
//  Copyright © 2020 jnr. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let charVC = UINavigationController(rootViewController: CharactersViewController())
    let planetsVC = UINavigationController(rootViewController: PlanetsViewController())
    let moviesVC = UINavigationController(rootViewController: MoviesViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        charVC.tabBarItem = UITabBarItem(title: "Characters", image: nil, selectedImage: nil)
        planetsVC.tabBarItem = UITabBarItem(title: "Planets", image: nil, selectedImage: nil)
        moviesVC.tabBarItem = UITabBarItem(title: "Movies", image: nil, selectedImage: nil)
        
        viewControllers = [charVC, planetsVC, moviesVC]
        
        tabBar.tintColor = UIColor(rgb: Colors.gray)
        tabBar.barTintColor = .white
    }

}
