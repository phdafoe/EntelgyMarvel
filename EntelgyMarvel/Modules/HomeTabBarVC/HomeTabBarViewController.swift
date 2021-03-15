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
        
        let oneViewController = ListCharactersAssembly().navigation()
        let twoViewController = ListCharactersAssembly().navigation()

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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
