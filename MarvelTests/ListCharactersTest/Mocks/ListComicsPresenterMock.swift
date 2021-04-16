//
//  ListComicsPresenterMock.swift
//  MarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/03/2021.
//

import Foundation
@testable import Marvel

protocol ListComicsPresenterMockProtocol: class {
    var count: Int { get }
    var isWasCalled: Bool { get }
}

class ListComicsPresenterMock: ListComicsPresenterProtocolOutput, ListComicsPresenterMockProtocol {
    
    
    
    var listComics: [ResultComics]? = []
    var count: Int = 0
    var isWasCalled = false

    func loadComics(with endpoint: ListEndPoint) {
        self.count += 1
        self.isWasCalled = true
        self.listComics = [ResultComics(id: 0,
                                        digitalId: 0,
                                        title: "",
                                        issueNumber: 0,
                                        variantDescription: "",
                                        resultDescription: "",
                                        modified: "",
                                        isbn: "",
                                        upc: "",
                                        diamondCode: "",
                                        ean: "",
                                        issn: "",
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
                                        events: nil)]
    }

    func getNumberOfRowCell() -> Int? {
        return listComics?.count
    }

    func getModelDataCell(index: Int) -> ResultComics? {
        return (listComics?[index])!
    }

    func showDetailCharacterFromView(data: ResultCharacter) {
        //
    }
    
    
    
}
