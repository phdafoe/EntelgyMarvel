//
//  BaseProtocols.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

public protocol BaseViewControllerProtocol: class {
    var basePresenter: BasePresenterProtocol? { get set }
}

// Protocol used to the Presenter can communicate with View
public protocol BaseViewProtocol: class {
    func showLoading(fullScreen: Bool)
    func hideLoading()
}

// Protocol used to the View can communicate with Presenter
public protocol BasePresenterProtocol: class {
    func viewDidLoad()
}

// Protocol used to the Presenter can communicate with Router
public protocol BaseRouterProtocol: class {
    
}

// Delegate used to report that a navigation has been done. It will usually be implemented by the Presenter
public protocol BaseRouterDelegate: class {
    func navigationDone()
}
