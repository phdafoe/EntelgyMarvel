//
//  ListComicsCoordinator.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import Foundation

// MARK: - module builder

final class ListComicsAssembly {
    
    static func buildNavigation() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: buildViewController())
        return navigationController
    }
    
    static func buildViewController() -> ListComicsViewController {
        let viewController = ListComicsViewController(nibName: ListComicsViewController.defaultReuseIdentifierViewController, bundle: nil)
        viewController.presenter = buildPresenter(viewController: viewController)
        return viewController
    }
    
    static fileprivate func buildPresenter(viewController: ListComicsViewController) -> ListComicsPresenterProtocolOutput {
        let presenter = ListComicsPresenter(viewController: viewController)
        presenter.provider = buildProvider()
        presenter.router = buildRouter(viewController: viewController, presenter: presenter)
        return presenter
    }
    
    static fileprivate func buildRouter(viewController: ListComicsViewController, presenter : ListComicsPresenterProtocolOutput) -> ListComicsRouterProtocolOutput {
        let router = ListComicsRouter(presenter: presenter, view: viewController)
        return router
    }
    
    static func buildProvider() -> ServiceManagerProtocol {
        let provider = StoreManager.shared
        return provider
    }
    
}

