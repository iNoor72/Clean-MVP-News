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
    
    var presenter: NewsDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        title = presenter?.getNewsTitle()
    }
    
    private func setupViews() {
        newsContentTextView.isEditable = false
        newsContentTextView.isScrollEnabled = true
        presenter.getNewsImage {[weak self] image in
            DispatchQueue.main.async {
                self?.newsImage.image = image
            }
        }
        publishedAtLabel.text = presenter.getNewsPublishingTime()
        newsContentTextView.text = presenter.getNewsContent()
        let author = presenter.getNewsAuthor()
        newsAuthorLabel.text = author != nil
        ? "By: " + (author ?? "No author")
        : "No author"
    }
}
