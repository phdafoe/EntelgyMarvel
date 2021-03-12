//
//  UIViewController+Extensions.swift
//  EntelgyMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit


extension UIViewController {
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            if let view = self?.view {
                self?.showLoader(inView: view)
            }
        }
    }

    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            if let view = self?.view {
                self?.hideLoader(fromView: view)
            }
        }
    }

    func showLoader(inView view: UIView) {

    }

    func hideLoader(fromView view: UIView) {

    }
}
