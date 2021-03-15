//
//  ListCharactersCoordinator.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

// MARK: - module builder

final class ListCharactersAssembly: MVPProtocol {

    typealias View = ListCharactersViewController
    typealias Presenter = ListCharactersPresenter
    typealias Router = ListCharactersRouter
    
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

