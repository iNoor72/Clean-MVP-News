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
    
    init(newsDetailsView: NewsDetailsViewControllerProtocol?) {
        self.newsDetailsView = newsDetailsView
    }
}
