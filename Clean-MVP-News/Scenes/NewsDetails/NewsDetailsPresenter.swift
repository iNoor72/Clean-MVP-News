//
//  NewsDetailsPresenter.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation
import UIKit.UIViewController

protocol NewsDetailsPresenterProtocol {
    func getNewsImage(completion: @escaping (UIImage?) -> Void)
    func getNewsTitle() -> String
    func getNewsAuthor() -> String?
    func getNewsContent() -> String?
    func getNewsPublishingTime() -> String
}

class NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    weak var newsDetailsView: NewsDetailsViewControllerProtocol?
    private let router: NavigationRouter!
    var article: Article
    
    init(newsDetailsView: NewsDetailsViewControllerProtocol?, router: NavigationRouter, article: Article) {
        self.newsDetailsView = newsDetailsView
        self.router = router
        self.article = article
        router.presentedView = newsDetailsView as? UIViewController
    }
    
    func getNewsImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageURLString = article.urlToImage else { return }
        guard let imageURL = URL(string: imageURLString) else { return }
        DispatchQueue.global().async {
            guard let data = AlamofireNetworkManager.fetchImage(with: imageURL) else { return }
            completion(UIImage(data: data))
        }
    }
    
    func getNewsTitle() -> String {
        return article.title
    }
    
    func getNewsAuthor() -> String? {
        return article.author
    }
    
    func getNewsContent() -> String? {
        return article.content
    }
    
    func getNewsPublishingTime() -> String {
        return article.publishedAt
    }
}
