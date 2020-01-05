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
    let moviesVC = UINavigationController(rootViewController: FilmsViewController())

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        charVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        planetsVC.tabBarItem = UITabBarItem(title: "Planets", image: UIImage(named: "globe"), selectedImage: UIImage(named: "globe"))
        moviesVC.tabBarItem = UITabBarItem(title: "Films", image: UIImage(named: "film"), selectedImage: UIImage(named: "film"))
        
        viewControllers = [charVC, planetsVC, moviesVC]
        
        tabBar.tintColor = UIColor(rgb: Colors.gray)
        tabBar.barTintColor = .white
    }

}
