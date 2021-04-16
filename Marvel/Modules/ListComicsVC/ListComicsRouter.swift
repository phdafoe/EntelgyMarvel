//
//  ListComicsRouter.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import Foundation
import UIKit

protocol ListComicsRouterProtocolOutput: class {
    //func showDetailCharacter(data: ResultCharacter)
}

final class ListComicsRouter: BaseRouter<ListComicsPresenterProtocolOutput> {
}

extension ListComicsRouter: ListComicsRouterProtocolOutput {
//    func showDetailCharacter(data: ResultCharacter) {
//        let vc = DetailCharacterCoordinator().build(dto: DetailCharacterCoordinatorDTO(data: data))
//        self.viewController?.navigationController?.pushViewController(vc, animated: true)
//    }
    

}
