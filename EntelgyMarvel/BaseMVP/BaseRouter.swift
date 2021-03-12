//
//  BaseRouter.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

class BaseRouter {
    
    // Declared weak for the ARC to destroy them.
     weak var baseView: UIViewController?
    weak var delegate: BaseRouterDelegate?
    
    // MARK: PRIVATE BASE
    public func rootViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.setViewControllers([viewControllerToPresent], animated: flag)
    }
    
    public func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
    }
    
    public func popViewController(animated: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.popViewController(animated: animated)
    }
    
    public func popToViewController(toViewController: UIViewController, animated: Bool) {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.popToViewController(toViewController, animated: animated)
    }
    
    public func popToRootViewController() {
        self.delegate?.navigationDone()
        self.baseView?.navigationController?.popToRootViewController(animated: true)
    }
    
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.delegate?.navigationDone()
        self.baseView?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    public func dismiss(animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        self.delegate?.navigationDone()
        self.baseView?.dismiss(animated: flag, completion: completion)
    }

    
}
