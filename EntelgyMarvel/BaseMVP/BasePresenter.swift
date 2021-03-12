//
//  BasePresenter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

class BasePresenter {
    
    // Declared weak for the ARC to destroy them.
    weak var baseView: BaseViewProtocol?
    var baseRouter: BaseRouterProtocol?
    
}
