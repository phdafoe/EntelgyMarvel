//
//  ListCharactersViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import UIKit

protocol ListCharactersViewPresenterInterface: ViewPresenterInterface {

}

class ListCharactersViewController: UIViewController, ViewInterface {
    
    var presenter: ListCharactersPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    

}

extension ListCharactersViewController: ListCharactersViewPresenterInterface {

}
