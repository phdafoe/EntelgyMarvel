//
//  ListCharactersRouter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

protocol ListCharactersRouterPresenterInterface: RouterPresenterInterface {
    func showDetailCharacter(data: ResultCharacter)
}

final class ListCharactersRouter: RouterInterface {
    weak var presenter: ListCharactersPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension ListCharactersRouter: ListCharactersRouterPresenterInterface {
    func showDetailCharacter(data: ResultCharacter) {
        let vc = DetailCharacterCoordinator().build(dto: DetailCharacterCoordinatorDTO(data: data))
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
