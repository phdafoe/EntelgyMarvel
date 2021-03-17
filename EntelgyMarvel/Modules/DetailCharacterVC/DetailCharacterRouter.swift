//
//  DetailCharacterRouter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

protocol DetailCharacterRouterProtocolOutput: RouterPresenterInterface {

    
}

final class DetailCharacterRouter: BaseRouter<DetailCharacterPresenterProtocolOutput> {
}

extension DetailCharacterRouter: DetailCharacterRouterProtocolOutput {

}
