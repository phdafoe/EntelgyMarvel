//
//  ListCharactersPresenterTest.swift
//  MarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/03/2021.
//

import XCTest
@testable import Marvel

class ListCharactersPresenterTest: XCTestCase {
    
    var listCharacterPresenter: ListCharactersPresenterProtocolOutput! = ListCharactersPresenter()
    var listCharacters: [ResultCharacter]! = []
    var providerMock: ServiceManagerProtocol! = ListCharactersProviderMock()
    var error: NSError?
    
    override func setUp() {
        self.listCharacterPresenter = ListCharactersPresenter()
        self.listCharacters = [ResultCharacter]()
        self.providerMock = ListCharactersProviderMock()
        ListCharactersProviderMock.mockErrorInFetchListaCharatersResponse = false
    }
    
    override func tearDown() {
        self.listCharacterPresenter = nil
        self.listCharacters = nil
        self.providerMock = nil
        self.error = nil
    }

    func test_loadCharacters_success() {
        let expect = expectation(description: "waiting")
        self.listCharacters = nil
        self.providerMock.fetchListCharacters(from: .characters) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTAssertNil(self.listCharacters)
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.data)
                XCTAssertNotNil(response.data?.results)
                self.listCharacters = response.data?.results
                XCTAssertNotNil(self.listCharacters)
                XCTAssertGreaterThan(self.listCharacters!.count, 0)
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
        self.listCharacters = nil
        self.providerMock.fetchListCharacters(from: .characters) { [weak self] (result) in
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
        let rowCell: Int = self.listCharacterPresenter.getNumberOfRowCell()!
        XCTAssertNotNil(rowCell)
    }
    
    func test_getNumberOfRowCell_Assert() {
        let expect = expectation(description: "waiting")
        self.listCharacters = nil
        self.providerMock.fetchListCharacters(from: .characters) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                XCTAssertNil(self.listCharacters)
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.data)
                XCTAssertNotNil(response.data?.results)
                self.listCharacters = response.data?.results
                XCTAssertNotNil(self.listCharacters)
                XCTAssertGreaterThan(self.listCharacters!.count, 0)
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
