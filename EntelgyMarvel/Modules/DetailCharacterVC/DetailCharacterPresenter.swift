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
    func loadDetailCharacter(whit endpoint: ListEndPoint)
    func getHeaderInfoOfRow(completion: @escaping (ResultCharacter?) -> Void)
    func getArrayItemComics() -> Int
    func getInfoComic(index: Int, completion: @escaping(ResultComic) -> Void)
}


final class DetailCharacterPresenter: PresenterInterface {
    
    // Dependencies
    var router: DetailCharacterRouterPresenterInterface!
    weak var view: DetailCharacterViewPresenterInterface!
    
    var listDetailComic: [ResultComic]? = []
    var dataResult: ResultCharacter? = nil
    var error: NSError?
    private let fetchService: ServiceManagerProtocol
    
    init(fetchService: ServiceManagerProtocol = StoreManager.shared) {
        self.fetchService = fetchService
    }
    
}

extension DetailCharacterPresenter: DetailCharacterPresenterRouterInterface {

}

extension DetailCharacterPresenter: DetailCharacterPresenterViewInterface {
    
    func loadDetailCharacter(whit endpoint: ListEndPoint) {

        self.fetchService.fetchDetailCharacter(from: endpoint, id: "\(self.dataResult?.id ?? 0)", typeEndpoint: .comics) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listDetailComic = response.data?.results
                self.view.reloadData()
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    internal func getHeaderInfoOfRow(completion: @escaping (ResultCharacter?) -> Void) {
        completion(dataResult)
    }
    
    internal func getArrayItemComics() -> Int {
        return listDetailComic?.count ?? 0
    }
    
    internal func getInfoComic(index: Int, completion: @escaping(ResultComic) -> Void) {
        completion(self.listDetailComic![index])
    }

    
    
    
    
    
    
}
