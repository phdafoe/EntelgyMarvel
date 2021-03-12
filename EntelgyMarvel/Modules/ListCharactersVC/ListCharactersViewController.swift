//
//  ListCharactersViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import UIKit

protocol ListCharactersViewPresenterInterface: ViewPresenterInterface {
    func getDataFromWeb(data: [ResultCharacter]?)
}

class ListCharactersViewController: UIViewController, ViewInterface {
    
    var presenter: ListCharactersPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.loadMovies(whit: .characters)
    }

}

extension ListCharactersViewController: ListCharactersViewPresenterInterface {
    func getDataFromWeb(data: [ResultCharacter]?) {
        print("\(data?.count ?? 0)")
    }
  
}

