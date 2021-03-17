//
//  DetailCharacterCoordinator.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

// MARK: - module builder

final class DetailCharacterAssembly {
    
    static func buildNavigation() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: buildViewController())
        return navigationController
    }
    
    static func buildViewController(dto: DetailCharacterCoordinatorDTO? = nil) -> DetailCharacterViewController {
        let viewController = DetailCharacterViewController(nibName: DetailCharacterViewController.defaultReuseIdentifierViewController, bundle: nil)
        viewController.presenter = buildPresenter(dto: dto, viewController: viewController)
        return viewController
    }
    
    static fileprivate func buildPresenter(dto: DetailCharacterCoordinatorDTO? = nil, viewController: DetailCharacterViewController) -> DetailCharacterPresenterProtocolOutput {
        let presenter = DetailCharacterPresenter(viewController: viewController)
        presenter.dataResult = dto?.data
        presenter.provider = buildProvider()
        presenter.router = buildRouter(viewController: viewController, presenter: presenter)
        return presenter
    }
    
    static fileprivate func buildRouter(viewController: DetailCharacterViewController, presenter : DetailCharacterPresenterProtocolOutput) -> DetailCharacterRouterProtocolOutput {
        let router = DetailCharacterRouter(presenter: presenter, view: viewController)
        return router
    }
    
    static func buildProvider() -> ServiceManagerProtocol {
        let provider = StoreManager.shared
        return provider
    }
    
}

struct DetailCharacterCoordinatorDTO {
    var data: ResultCharacter
}
