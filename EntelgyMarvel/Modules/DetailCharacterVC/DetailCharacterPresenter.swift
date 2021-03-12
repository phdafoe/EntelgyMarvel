//
//  DetailCharacterPresenter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

protocol DetailCharacterPresenterRouterInterface: PresenterRouterInterface {

}

protocol DetailCharacterPresenterViewInterface: PresenterViewInterface {
    
}


final class DetailCharacterPresenter: PresenterInterface {
    
    // Dependencies
    var router: ListCharactersRouterPresenterInterface!
    weak var view: ListCharactersViewPresenterInterface!
}

extension DetailCharacterPresenter: DetailCharacterPresenterRouterInterface {

}

extension DetailCharacterPresenter: DetailCharacterPresenterViewInterface {
    
    
    
}
