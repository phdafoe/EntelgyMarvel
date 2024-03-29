//
//  DetailCharacterPresenter.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation



protocol DetailCharacterPresenterProtocolOutput: class {
    func loadDetailCharacter(whit endpoint: ListEndPoint)
    func loadDetailSeries(whit endpoint:ListEndPoint)
    func getHeaderInfoOfRow(completion: @escaping (ResultCharacter?) -> Void)
    func getArrayItemComics() -> Int
    func getInfoComic(index: Int, completion: @escaping(ResultComic) -> Void)
    func getInfoSeries(completion: @escaping ([ResultSeries]?) -> Void)
}


final class DetailCharacterPresenter: BasePresenter<DetailCharacterViewPresenterInterface, DetailCharacterRouterProtocolOutput> {
        
    var listDetailComic: [ResultComic]? = []
    var listSeries: [ResultSeries]? = []
    var dataResult: ResultCharacter? = nil
    var error: NSError?
    var provider: ServiceManagerProtocol!
    
    
    
}


extension DetailCharacterPresenter: DetailCharacterPresenterProtocolOutput {
    
    func loadDetailCharacter(whit endpoint: ListEndPoint) {
        self.provider.fetchDetailCharacter(from: endpoint, id: "\(self.dataResult?.id ?? 0)", typeEndpoint: .comics) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listDetailComic = response.data?.results
                self.viewController?.reloadData()
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    func loadDetailSeries(whit endpoint: ListEndPoint) {
        self.provider.fetchDetailSeries(from: endpoint, id: "\(self.dataResult?.id ?? 0)", typeEndpoint: .series) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.listSeries = response.data?.results
                self.viewController?.reloadData()
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
    
    func getInfoSeries(completion: @escaping ([ResultSeries]?) -> Void) {
        completion(self.listSeries!)
    }

    
    
    
    
    
    
}
