//
//  DetailCharacterViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import UIKit

protocol DetailCharacterViewPresenterInterface: ViewPresenterInterface {
    func reloadData()
}

class DetailCharacterViewController: UIViewController, ViewInterface {

    var presenter: DetailCharacterPresenterViewInterface!
    
    @IBOutlet weak var myDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.loadDetailCharacter(whit: .characters)
        self.presenter.loadDetailSeries(whit: .characters)
        
        self.myDetailTableView.delegate = self
        self.myDetailTableView.dataSource = self
        
        self.myDetailTableView.register(UINib(nibName: HeaderDetailCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: HeaderDetailCell.defaultReuseIdentifier)
        
        self.myDetailTableView.register(UINib(nibName: SeriesTableCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: SeriesTableCell.defaultReuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myDetailTableView.reloadData()
    }
    
    

}

extension DetailCharacterViewController: DetailCharacterViewPresenterInterface {
    internal func reloadData() {
        self.myDetailTableView.reloadData()
    }
    
}

extension DetailCharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return self.presenter.getArrayItemComics()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            self.presenter.getHeaderInfoOfRow { (resultHeader) in
                if let resultHeaderDes = resultHeader {
                    cell.setInfoHeaderView(data: resultHeaderDes)
                }
            }
            return cell
        default:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: SeriesTableCell.defaultReuseIdentifier, for: indexPath) as! SeriesTableCell
            self.presenter.getInfoComic(index: indexPath.row) { (result) in
                cell.setInfo(data: result)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 220
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 220
        default:
            return UITableView.automaticDimension
        }
    }
}
