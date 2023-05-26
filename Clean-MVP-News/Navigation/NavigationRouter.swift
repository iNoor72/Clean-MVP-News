//
//  NavigationRouter.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import UIKit.UIViewController

final class NavigationRouter: RouterProtocol {
    
    weak var presentedView: UIViewController?
    
    func present(_ view: UIViewController, shouldBeFullScreen: Bool) {
        if shouldBeFullScreen { view.modalPresentationStyle = .fullScreen }
        presentedView?.present(view, animated: true, completion: nil)
    }
    
    func dismiss() {
        presentedView?.dismiss(animated: true, completion: nil)
    }
    
    func popToRoot() {
        presentedView?.navigationController?.popToRootViewController(animated: true)
    }
    
    func push(_ view: UIViewController) {
        presentedView?.navigationController?.pushViewController(view, animated: true)
    }
}
