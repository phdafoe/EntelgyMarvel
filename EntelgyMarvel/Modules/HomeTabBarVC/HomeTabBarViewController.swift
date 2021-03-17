//
//  HomeTabBarViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/03/2021.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oneViewController = ListCharactersAssembly.buildNavigation()
        let twoViewController = ListComicsAssembly.buildNavigation()

        let customOneTabBarItem = UITabBarItem(title: nil,
                                               image: UIImage(named: "reloj")?.withRenderingMode(.alwaysOriginal),
                                               selectedImage: UIImage(named: "reloj"))
        
        let customTwoTabBarItem = UITabBarItem(title: nil,
                                               image: UIImage(named: "reloj")?.withRenderingMode(.alwaysOriginal),
                                               selectedImage: UIImage(named: "reloj"))
        
        oneViewController.tabBarItem = customOneTabBarItem
        twoViewController.tabBarItem = customTwoTabBarItem
        self.viewControllers = [oneViewController, twoViewController]
    }

}
