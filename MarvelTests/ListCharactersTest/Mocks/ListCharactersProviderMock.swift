//
//  ListCharactersProviderMock.swift
//  MarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/03/2021.
//

import Foundation
@testable import Marvel

class ListCharactersProviderMock: ServiceManagerProtocol {
    
    public static var isFetchDataIsCalled = false
    public static var mockErrorInFetchListaCharatersResponse = false
    var arrayResultCharacter: ResultCharacter?
    var listCharacterModel: ListCharacteresModel?
    
    var arrayResultComics: ResultComics?
    var listComicsModel: ListComicsModel?
    
    
    func fetchListCharacters(from endpoint: ListEndPoint, completion: @escaping (Result<ListCharacteresModel, ApiError>) -> ()) {
        ListCharactersProviderMock.isFetchDataIsCalled = true
        var myArrayResultCharacter: [ResultCharacter] = []
        self.arrayResultCharacter = ResultCharacter(id: 82967,
                                               name: "Marvel Previews (2017)",
                                               resultDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                               modified: "2018-01-22T15:42:11-0500",
                                               thumbnail: nil,
                                               resourceURI: "http://gateway.marvel.com/v1/public/comics/82967",
                                               comics: nil,
                                               series: nil,
                                               stories: nil,
                                               events: nil,
                                               urls: nil)
        myArrayResultCharacter.append(self.arrayResultCharacter!)
        self.listCharacterModel = ListCharacteresModel(code: 200,
                                                  status: "OK",
                                                  copyright: "© 2021 MARVEL",
                                                  attributionText: "Data provided by Marvel. © 2021 MARVEL",
                                                  attributionHTML: "<a href=\"http://marvel.com\">Data provided by Marvel. © 2021 MARVEL</a>",
                                                  etag: "e2f7734f62d93429c7d983025f216833e52c9b09",
                                                  data: DataClassCharacters(offset: 0,
                                                                            limit: 20,
                                                                            total: 48381,
                                                                            count: 20,
                                                                            results: myArrayResultCharacter))
        if ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse {
            self.executeCompletionHandlerInMainThread(whit: .failure(.invalidResponse), completion: completion)
        } else {
            self.executeCompletionHandlerInMainThread(whit: .success(self.listCharacterModel!), completion: completion)
        }
    }
    
    func fetchDetailCharacter(from endpoint: ListEndPoint, id: String, typeEndpoint: ListEndPoint, completion: @escaping (Result<DetailComicModel, ApiError>) -> ()) {
        //
    }
    
    func fetchDetailSeries(from endpoint: ListEndPoint, id: String, typeEndpoint: ListEndPoint, completion: @escaping (Result<DetailSeriesModel, ApiError>) -> ()) {
        //
    }
    
    func fetchListComics(from endpoint: ListEndPoint, completion: @escaping (Result<ListComicsModel, ApiError>) -> ()) {
        ListCharactersProviderMock.isFetchDataIsCalled = true
        var myArrayResultComics: [ResultComics] = []
        self.arrayResultComics = ResultComics(id: 0,
                                              digitalId: 0,
                                              title: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                              issueNumber: 0,
                                              variantDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                              resultDescription: "The Marvel Age of Comics continues! This time around, Spidey meets his match against such classic villains as Electro and the Lizard, and faces the return of one of his first foes: the Vulture! Plus: Spider-Man vs. the Living Brain, Peter Parker's fight with Flash Thompson, and the wall-crawler tackles the high-flying Human Torch!",
                                              modified: "2018-01-22T15:42:11-0500",
                                              isbn: nil,
                                              upc: nil,
                                              diamondCode: nil,
                                              ean: nil,
                                              issn: nil,
                                              format: nil,
                                              pageCount: nil,
                                              textObjects: nil,
                                              resourceURI: nil,
                                              urls: nil,
                                              series: nil,
                                              variants: nil,
                                              collections: nil,
                                              collectedIssues: nil,
                                              dates: nil,
                                              prices: nil,
                                              thumbnail: nil,
                                              images: nil,
                                              creators: nil,
                                              characters: nil,
                                              stories: nil,
                                              events: nil)
        myArrayResultComics.append(self.arrayResultComics!)
        self.listComicsModel = ListComicsModel(code: 200,
                                               status: "OK",
                                               copyright: "© 2021 MARVEL",
                                               attributionText: "Data provided by Marvel. © 2021 MARVEL",
                                               attributionHTML: "<a href=\"http://marvel.com\">Data provided by Marvel. © 2021 MARVEL</a>",
                                               etag: "e2f7734f62d93429c7d983025f216833e52c9b09",
                                               data: DataClassComics(offset: 0,
                                                                     limit: 20,
                                                                     total: 48123,
                                                                     count: 20,
                                                                     results: myArrayResultComics))
        
        if ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse {
            self.executeCompletionHandlerInMainThread(whit: .failure(.invalidResponse), completion: completion)
        } else {
            self.executeCompletionHandlerInMainThread(whit: .success(self.listComicsModel!), completion: completion)
        }        
    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(whit result: Result<D, ApiError>, completion: @escaping (Result<D, ApiError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
    
}

