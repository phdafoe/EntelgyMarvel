//
//  HomeTabBarViewController.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/03/2021.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oneViewController = ListCharactersAssembly.buildNavigation()
        let twoViewController = ListComicsAssembly.buildNavigation()

        let customOneTabBarItem = UITabBarItem(title: "Characters",
                                               image: UIImage(named: "reloj")?.withRenderingMode(.alwaysOriginal),
                                               selectedImage: UIImage(named: "reloj"))
        
        let customTwoTabBarItem = UITabBarItem(title: "Comics",
                                               image: UIImage(named: "reloj")?.withRenderingMode(.alwaysOriginal),
                                               selectedImage: UIImage(named: "reloj"))
        
        oneViewController.tabBarItem = customOneTabBarItem
        twoViewController.tabBarItem = customTwoTabBarItem
        self.viewControllers = [oneViewController, twoViewController]
    }

}
