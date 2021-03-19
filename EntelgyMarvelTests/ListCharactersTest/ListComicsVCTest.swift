//
//  ListComicsVCTest.swift
//  EntelgyMarvelTests
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/03/2021.
//

import XCTest
@testable import EntelgyMarvel

class ListComicsVCTest: XCTestCase {
    
    var listComicsVC: BaseViewController<ListComicsPresenterProtocolOutput>!
    var presenter: ListComicsPresenterMock! = ListComicsPresenterMock()

    override func setUp() {
        self.listComicsVC = ListComicsAssembly.buildViewController()
        self.presenter = ListComicsPresenterMock()
    }

    override func tearDown() {
        self.listComicsVC = nil
        self.presenter = nil
    }
    
    func test_listCharactersViewController_success_presenter_mock() {
        
        self.listComicsVC.presenter = nil
        XCTAssertNil(self.listComicsVC.presenter)
        
        self.listComicsVC.presenter = self.presenter
        XCTAssertNotNil(self.listComicsVC.presenter)
        
    }
    
    func test_listCharactersViewController_viewDidLoad_call() {
        self.listComicsVC.presenter = self.presenter
        XCTAssertEqual(self.presenter.count, 0)
        self.listComicsVC.beginAppearanceTransition(true, animated: false)
        XCTAssertEqual(self.presenter.count, 1)
        XCTAssertTrue(self.presenter.isWasCalled)
        self.listComicsVC.endAppearanceTransition()
    }

}
