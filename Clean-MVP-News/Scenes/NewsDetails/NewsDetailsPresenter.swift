//
//  NewsDetailsPresenter.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation

protocol NewsDetailsPresenterProtocol {
    
}

class NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    weak var newsDetailsView: NewsDetailsViewControllerProtocol?
    private let router: NavigationRouter!
    var article: Article
    
    init(newsDetailsView: NewsDetailsViewControllerProtocol?, router: NavigationRouter, article: Article) {
        self.newsDetailsView = newsDetailsView
        self.router = router
        self.article = article
    }
}
