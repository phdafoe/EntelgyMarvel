//
//  BaseMVP.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

class BaseViewController <T>: UIViewController {
     var presenter: T?
}

class BasePresenter <T, U> {
    
    internal var viewController: T?
    internal var router: U?
    
    convenience init (viewController: T, router: U? = nil) {
        self.init()
        self.viewController = viewController
        self.router = router
    }
    
}

class BaseRouter<P> {
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    
    //MARK: LIFE CYCLE
    //Class initializer
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    //MARK: PRIVATE
    internal func show(_ vc: UIViewController){
        if let navigationController = viewController?.navigationController {
            DispatchQueue.main.async {
                navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        if let navigationController = viewController?.navigationController {
            navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
            return
        }
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}



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


