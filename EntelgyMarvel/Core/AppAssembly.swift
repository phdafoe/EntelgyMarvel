//
//  AppAssembly.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol: class {
    func applicationShowInitVC(_ window: UIWindow)
}

final class AppAssembly {
    
    private (set) var actualViewController: UIViewController!
    
    internal func applicationShowInitVC(_ window: UIWindow) {
        self.customUI()
        actualViewController = HomeTabBarViewController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
    
    fileprivate func customUI(){
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        let toolBar = UIToolbar.appearance()
        
        navBar.barTintColor = Helpers.Colores().AZUL_NAV
        tabBar.barTintColor = Helpers.Colores().AZUL_NAV
        
        toolBar.barTintColor = Helpers.Colores().AZUL_NAV
        toolBar.tintColor = Helpers.Colores().BLANCO_TEXTO_NAV
        
        navBar.tintColor = Helpers.Colores().BLANCO_TEXTO_NAV
        tabBar.tintColor = Helpers.Colores().BLANCO_TEXTO_NAV
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor :  Helpers.Colores().BLANCO_TEXTO_NAV]
    }
}
