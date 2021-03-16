//
//  ListComicsViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import UIKit

protocol ListComicsViewPresenterInterface: ViewPresenterInterface {
    func reloadData()
}

class ListComicsViewController: UIViewController, ViewInterface {

    var presenter: ListComicsPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comics"
        self.presenter.loadComics(whit: .comics)

        // Do any additional setup after loading the view.
    }


}

extension ListComicsViewController: ListComicsViewPresenterInterface {
   
    internal func reloadData() {
        //self.myCollectionView.reloadData()
    }
}
