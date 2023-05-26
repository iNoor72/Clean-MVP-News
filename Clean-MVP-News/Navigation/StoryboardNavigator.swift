//
//  StoryboardNavigator.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import UIKit

enum StoryboardNavigator: String {
    case main
    
    func viewController<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let viewController = UIStoryboard(name: self.rawValue.capitalized, bundle: nil)
                .instantiateViewController(withIdentifier: String(describing: VC.self)) as? VC
            else { fatalError("Couldn't instantiate \(VC.self) from \(self.rawValue)") }
        
        return viewController
    }
}
