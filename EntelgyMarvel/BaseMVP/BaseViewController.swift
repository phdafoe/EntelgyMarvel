//
//  BaseViewController.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    public var basePresenter: BasePresenterProtocol?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.basePresenter?.viewDidLoad()
    }
    
    
    // MARK: Loader
    func showLoading(fullScreen: Bool) {
       self.showLoader()
    }
     
    func hideLoading() {
       self.hideLoader()
    }
    
}

// MARK: BaseViewControllerProtocol
extension BaseViewController: BaseViewControllerProtocol {}


