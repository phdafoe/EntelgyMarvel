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
        
        self.myDetailTableView.delegate = self
        self.myDetailTableView.dataSource = self
        
        self.myDetailTableView.register(UINib(nibName: HeaderDetailCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: HeaderDetailCell.defaultReuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    

}

extension DetailCharacterViewController: DetailCharacterViewPresenterInterface {
    internal func reloadData() {
        self.myDetailTableView.reloadData()
    }
    
}

extension DetailCharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        case 1:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        case 2:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        case 3:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        case 4:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        case 5:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        default:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            if let dataModel = self.presenter.getHeaderInfoOfRow() {
                cell.setInfoHeaderView(data: dataModel)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 1
        default:
            return 0
        }
    }
}
