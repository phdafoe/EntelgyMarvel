//
//  ListComicsPresenterTest.swift
//  EntelgyMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/03/2021.
//

import XCTest
@testable import EntelgyMarvel

class ListComicsPresenterTest: XCTestCase {
    
    var listComicsPresenter: ListComicsPresenterProtocolOutput! = ListComicsPresenter()
    var listComics: [ResultComics]! = []
    var providerMock: ServiceManagerProtocol! = ListCharactersProviderMock()
    var error: NSError?

    override func setUp() {
        self.listComicsPresenter = ListComicsPresenter()
        self.listComics = [ResultComics]()
        self.providerMock = ListCharactersProviderMock()
        ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse = false
    }
    
    override func tearDown() {
        self.listComicsPresenter = nil
        self.listComics = nil
        self.providerMock = nil
        self.error = nil
    }
    
    func test_loadCharacters_success() {
        let expect = expectation(description: "waiting")
        self.listComics = nil
        self.providerMock.fetchListComics(from: .comics) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTAssertNil(self.listComics)
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.data)
                XCTAssertNotNil(response.data?.results)
                self.listComics = response.data?.results
                XCTAssertNotNil(self.listComics)
                XCTAssertGreaterThan(self.listComics!.count, 0)
                expect.fulfill()
            case .failure(let error):
                XCTFail("Expect success got \(error) instead")
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }
    
    func test_loadCharacters_fail() {
        ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse = true
        let expect = expectation(description: "waiting")
        self.listComics = nil
        self.providerMock.fetchListComics(from: .comics) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTFail("Expect success got \(response) instead")
                expect.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error, .invalidResponse)
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }
    
    
    func test_getNumberOfRowCell_Assert_is_never_nil() {
        let rowCell: Int = self.listComicsPresenter.getNumberOfRowCell()!
        XCTAssertNotNil(rowCell)
    }
    
    func test_getNumberOfRowCell_Assert() {
        let expect = expectation(description: "waiting")
        self.listComics = nil
        self.providerMock.fetchListComics(from: .comics) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTAssertNil(self.listComics)
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.data)
                XCTAssertNotNil(response.data?.results)
                self.listComics = response.data?.results
                XCTAssertNotNil(self.listComics)
                XCTAssertGreaterThan(self.listComics!.count, 0)
                //let rowCell: Int = self.listCharacterPresenter.getNumberOfRowCell()!
                //XCTAssertGreaterThan(rowCell, 0)
                expect.fulfill()
            case .failure(let error):
                XCTFail("Expect success got \(error) instead")
                expect.fulfill()
            }
        }
        wait(for: [expect], timeout: 3)
    }
    
    func test_getModelDataCell() {
        
    }

}
