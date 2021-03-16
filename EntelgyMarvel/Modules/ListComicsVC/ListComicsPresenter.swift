//
//  ListComicsPresenter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import Foundation

protocol ListComicsPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol ListComicsPresenterViewInterface: PresenterViewInterface {
    func loadComics(whit endpoint: ListEndPoint)
    //func getNumberOfRowCell() -> Int?
    //func getModelDataCell(index: Int) -> ResultCharacter?
    //func showDetailCharacterFromView(data: ResultCharacter)
}

final class ListComicsPresenter: PresenterInterface {
    
    // Dependencies
    var router: ListComicsRouterPresenterInterface!
    weak var view: ListComicsViewPresenterInterface!
    var listComics: [ResultComics]? = []
    var error: NSError?
    
    private let fetchService: ServiceManagerProtocol
    
    init(fetchService: ServiceManagerProtocol = StoreManager.shared) {
        self.fetchService = fetchService
    }
 
}

extension ListComicsPresenter: ListComicsPresenterRouterInterface {

}

extension ListComicsPresenter: ListComicsPresenterViewInterface {
    internal func loadComics(whit endpoint: ListEndPoint) {
        self.listComics = nil
        self.fetchService.fetchListComics(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listComics = response.data?.results
                self.view.reloadData()
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
