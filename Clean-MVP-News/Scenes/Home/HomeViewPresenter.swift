//
//  HomeViewPresenter.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation
import UIKit.UIViewController

protocol HomeViewPresenterProtocol {
    func getNewsBasedOnUserPreference()
    func navigateToArticle(at index: Int)
    func getNewsCount() -> Int
    func getNews(at index: Int) -> Article?
    func getNewsType() -> NewsType
}

class HomeViewPresenter: HomeViewPresenterProtocol {
    weak var homeView: HomeViewControllerProtocol?
    private let router: NavigationRouter!
    private let interactor: HomeViewInteractor
    
    private var newsArticles: [Article]?
    
    init(homeView: HomeViewControllerProtocol?, router: NavigationRouter, interactor: HomeViewInteractor = HomeViewInteractor()) {
        self.homeView = homeView
        self.router = router
        self.interactor = interactor
        router.presentedView = homeView as? UIViewController
    }
    
    func getNewsCount() -> Int {
        return newsArticles?.count ?? 0
    }
    
    func getNews(at index: Int) -> Article? {
        return newsArticles?[index]
    }
    
    func getNewsBasedOnUserPreference() {
        let preference = getNewsType()
        getNews(for: preference)
    }
    
    func getNewsType() -> NewsType {
        let userPreference = UserDefaults.standard.string(forKey: AppConstants.UserDefaultsKeys.newsPreferenceKey) ?? NewsType.allNews.rawValue
        let preference = NewsType(rawValue: userPreference) ?? .allNews
        return preference
    }
    
    private func getNews(for type: NewsType) {
        interactor.fetchNewsFromNetwork(for: type) {[weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .failure(let error):
                self.homeView?.showError(error: error as NSError)
                
            case .success(let newsResponse):
                guard let articles = newsResponse.articles, !articles.isEmpty else { homeView?.showError(error: nil); return }
                self.newsArticles = articles
                self.homeView?.reloadTableView()
            }
        }
    }
    
    func navigateToArticle(at index: Int) {
        guard let article = newsArticles?[index] else { return }
        let detailsViewController = NewsDetailsViewController()
        detailsViewController.presenter = NewsDetailsPresenter(newsDetailsView: detailsViewController, router: NavigationRouter(), article: article)
        router.push(detailsViewController)
    }
}
