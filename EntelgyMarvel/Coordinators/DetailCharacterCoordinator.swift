//
//  DetailCharacterCoordinator.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

// MARK: - module builder

final class DetailCharacterCoordinator: MVPProtocol {

    typealias View = DetailCharacterViewController
    typealias Presenter = DetailCharacterPresenter
    typealias Router = DetailCharacterRouter

    func build() -> UIViewController {
        let view = View()
        let presenter = Presenter()
        let router = Router()
        self.assemble(view: view, presenter: presenter, router: router)
        router.viewController = view
        return view
    }
}
