//
//  BaseMVP.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation

// MARK: - Protocols
public protocol RouterPresenterInterface: class {

}

public protocol PresenterRouterInterface: class {

}

public protocol PresenterViewInterface: class {

}

public protocol ViewPresenterInterface: class {

}

// MARK: - MVP
public protocol RouterInterface: RouterPresenterInterface {
    associatedtype PresenterRouter
    var presenter: PresenterRouter! { get set }
}

public protocol PresenterInterface: PresenterRouterInterface & PresenterViewInterface {
    associatedtype RouterPresenter
    associatedtype ViewPresenter
    var router: RouterPresenter! { get set }
    var view: ViewPresenter! { get set }
}

public protocol ViewInterface: ViewPresenterInterface {
    associatedtype PresenterView
    var presenter: PresenterView! { get set }
}

public protocol EntityInterface {

}

public protocol MVPProtocol {
    
    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    
}

public extension MVPProtocol {

    func assemble(view: View, presenter: Presenter, router: Router) {
        view.presenter = (presenter as? Self.View.PresenterView)
        presenter.view = (view as? Self.Presenter.ViewPresenter)
        presenter.router = (router as? Self.Presenter.RouterPresenter)
        router.presenter = (presenter as? Self.Router.PresenterRouter)
    }
}
