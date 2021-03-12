//
//  DetailCharacterViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import UIKit

protocol DetailCharacterViewPresenterInterface: ViewPresenterInterface {
    
}

class DetailCharacterViewController: UIViewController, ViewInterface {

    var presenter: ListCharactersPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension DetailCharacterViewController: DetailCharacterViewPresenterInterface {
    
}
