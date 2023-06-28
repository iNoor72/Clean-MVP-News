//
//  NewsDetailsViewController.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 13/04/2023.
//

import UIKit

protocol NewsDetailsViewControllerProtocol: AnyObject {
    
}

class NewsDetailsViewController: UIViewController, NewsDetailsViewControllerProtocol {
    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var newsContentTextView: UITextView!
    @IBOutlet private weak var newsAuthorLabel: UILabel!
    @IBOutlet private weak var publishedAtLabel: UILabel!
    
    var presenter: NewsDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        
    }
}
