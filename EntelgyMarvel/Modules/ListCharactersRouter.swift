//
//  ListCharactersRouter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

protocol ListCharactersRouterPresenterInterface: RouterPresenterInterface {

}

final class ListCharactersRouter: RouterInterface {
    weak var presenter: ListCharactersPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension ListCharactersRouter: ListCharactersRouterPresenterInterface {

}
