//
//  DetailCharacterRouter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

protocol DetailCharacterRouterPresenterInterface: RouterPresenterInterface {

    
}

final class DetailCharacterRouter: RouterInterface {
    weak var presenter: DetailCharacterPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension DetailCharacterRouter: DetailCharacterRouterPresenterInterface {

}
