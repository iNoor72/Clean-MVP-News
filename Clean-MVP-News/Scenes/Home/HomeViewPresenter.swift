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
    
    init(homeView: HomeViewControllerProtocol?) {
        self.homeView = homeView
    }
    
    func getNews() {
        
    }
    
    func getHealthNews() {
        
    }
    
    func getScienceNews() {
        
    }
}
