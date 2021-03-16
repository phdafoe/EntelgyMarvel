//
//  ListComicsCoordinator.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import Foundation
import UIKit

// MARK: - module builder

final class ListComicsAssembly: MVPProtocol {

    typealias View = ListComicsViewController
    typealias Presenter = ListComicsPresenter
    typealias Router = ListComicsRouter
    
    func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: self.build())
        return navVC
    }

    func build() -> UIViewController {
        let view = View()
        let presenter = Presenter()
        let router = Router()
        self.assemble(view: view, presenter: presenter, router: router)
        router.viewController = view
        return view
    }
}

