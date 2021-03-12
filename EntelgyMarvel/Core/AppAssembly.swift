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
        actualViewController = ListCharactersViewController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
}
