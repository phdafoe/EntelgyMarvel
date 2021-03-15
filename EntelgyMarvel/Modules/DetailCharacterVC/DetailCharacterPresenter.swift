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
    func getHeaderInfoOfRow() -> ResultCharacter?
}


final class DetailCharacterPresenter: PresenterInterface {
    
    // Dependencies
    var router: DetailCharacterRouterPresenterInterface!
    weak var view: DetailCharacterViewPresenterInterface!
    
    var dataResult: ResultCharacter? = nil
    
}

extension DetailCharacterPresenter: DetailCharacterPresenterRouterInterface {

}

extension DetailCharacterPresenter: DetailCharacterPresenterViewInterface {

    
    internal func getHeaderInfoOfRow() -> ResultCharacter? {
        return dataResult
        self.view.reloadData()
    }

    
    
    
    
    
    
}
