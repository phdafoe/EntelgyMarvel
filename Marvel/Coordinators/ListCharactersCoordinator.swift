//
//  ListCharactersCoordinator.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

// MARK: - module builder

final class ListCharactersAssembly {
    
    static func buildNavigation() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: buildViewController())
        return navigationController
    }
    
    static func buildViewController() -> ListCharactersViewController {
        let viewController = ListCharactersViewController(nibName: ListCharactersViewController.defaultReuseIdentifierViewController, bundle: nil)
        viewController.presenter = buildPresenter(viewController: viewController)
        return viewController
    }
    
    static fileprivate func buildPresenter(viewController: ListCharactersViewController) -> ListCharactersPresenterProtocolOutput {
        let presenter = ListCharactersPresenter(viewController: viewController)
        presenter.provider = buildProvider()
        presenter.router = buildRouter(viewController: viewController, presenter: presenter)
        
        return presenter
    }
    
    static fileprivate func buildRouter(viewController: ListCharactersViewController, presenter : ListCharactersPresenterProtocolOutput) -> ListCharactersRouterProtocolOutput {
        let router = ListCharactersRouter(presenter: presenter, view: viewController)
        return router
    }
    
    static func buildProvider() -> ServiceManagerProtocol {
        let provider = StoreManager.shared
        return provider
    }
    
}

