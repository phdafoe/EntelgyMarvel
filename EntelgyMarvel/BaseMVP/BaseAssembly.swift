//
//  BaseAssembly.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

class BaseAssembly {
    
    static func baseAssembly<V: BaseViewControllerProtocol,
                             P:BasePresenter,
                             R: BaseRouter>(baseView: V,
                                            presenter: P.Type,
                                            router: R.Type) -> (view: V,
                                                                presenter: P,
                                                                router: R) {
        
        let basePresenter = P()
        let baseRouter = R()
        
        baseView.basePresenter = basePresenter as? BasePresenterProtocol
        
        basePresenter.baseView = baseView as? BaseViewProtocol
        basePresenter.baseRouter = baseRouter as? BaseRouterProtocol
        
        baseRouter.baseView = baseView as? UIViewController
        baseRouter.delegate = basePresenter
        
        return (baseView, basePresenter, baseRouter)
    }
}
