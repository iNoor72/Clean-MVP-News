//
//  HomeViewPresenter.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation

protocol HomeViewPresenterProtocol {
    func getNews()
    func getHealthNews()
    func getScienceNews()
}

class HomeViewPresenter: HomeViewPresenterProtocol {
    weak var homeView: HomeViewControllerProtocol?
    private let router: NavigationRouter!
    
    init(homeView: HomeViewControllerProtocol?, router: NavigationRouter) {
        self.homeView = homeView
        self.router = router
    }
    
    func getNews() {
        
    }
    
    func getHealthNews() {
        
    }
    
    func getScienceNews() {
        
    }
}
