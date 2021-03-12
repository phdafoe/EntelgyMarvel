//
//  ListCharactersPresenter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

protocol ListCharactersPresenterRouterInterface: PresenterRouterInterface {

}

protocol ListCharactersPresenterViewInterface: PresenterViewInterface {
    func loadMovies(whit endpoint: ListEndPoint)
}

final class ListCharactersPresenter: PresenterInterface {
    
    // Dependencies
    var router: ListCharactersRouterPresenterInterface!
    weak var view: ListCharactersViewPresenterInterface!
    
    var listCharacters: [ResultCharacter]?
    var isLoading = false
    var error: NSError?
    
    private let fetchService: ServiceManagerProtocol
    
    init(fetchService: ServiceManagerProtocol = StoreManager.shared) {
        self.fetchService = fetchService
    }
 
}

extension ListCharactersPresenter: ListCharactersPresenterRouterInterface {

}

extension ListCharactersPresenter: ListCharactersPresenterViewInterface {
    
    internal func loadMovies(whit endpoint: ListEndPoint) {
        self.listCharacters = nil
        self.isLoading = false
        self.fetchService.fetchListCharacters(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.listCharacters = response.data?.results
                self.view.getDataFromWeb(data: self.listCharacters)
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
