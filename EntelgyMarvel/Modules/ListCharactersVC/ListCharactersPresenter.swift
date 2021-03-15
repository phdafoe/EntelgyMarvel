//
//  ListCharactersPresenter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import Kingfisher

protocol ListCharactersPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol ListCharactersPresenterViewInterface: PresenterViewInterface {
    func loadMovies(whit endpoint: ListEndPoint)
    func getNumberOfRowCell() -> Int?
    func getModelDataCell(index: Int) -> ResultCharacter?
    func showDetailCharacterFromView(data: ResultCharacter)
}

final class ListCharactersPresenter: PresenterInterface {
    
    // Dependencies
    var router: ListCharactersRouterPresenterInterface!
    weak var view: ListCharactersViewPresenterInterface!
    
    var listCharacters: [ResultCharacter]? = []
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
    func showDetailCharacterFromView(data: ResultCharacter) {
        self.router.showDetailCharacter(data: data)
    }
    
    
    internal func loadMovies(whit endpoint: ListEndPoint) {
        self.listCharacters = nil
        self.isLoading = false
        self.fetchService.fetchListCharacters(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.listCharacters = response.data?.results
                self.view.reloadData()
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    internal func getNumberOfRowCell() -> Int? {
        return listCharacters?.count ?? 0
    }

    internal func getModelDataCell(index: Int) -> ResultCharacter? {
        return (listCharacters?[index])!
    }
    
   
    
}
