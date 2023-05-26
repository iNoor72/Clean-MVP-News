//
//  RouterProtocol.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import UIKit.UIViewController

protocol RouterProtocol: AnyObject {
    
    var presentedView: UIViewController? { get set }

    func present(_ view: UIViewController, shouldBeFullScreen: Bool)
    func dismiss()
    func push(_ view: UIViewController)
    func popToRoot()
}
