//
//  ListComicsRouter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import Foundation
import UIKit

protocol ListComicsRouterPresenterInterface: RouterPresenterInterface {
    //func showDetailCharacter(data: ResultCharacter)
}

final class ListComicsRouter: RouterInterface {
    weak var presenter: ListComicsPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension ListComicsRouter: ListComicsRouterPresenterInterface {
//    func showDetailCharacter(data: ResultCharacter) {
//        let vc = DetailCharacterCoordinator().build(dto: DetailCharacterCoordinatorDTO(data: data))
//        self.viewController?.navigationController?.pushViewController(vc, animated: true)
//    }
    

}
