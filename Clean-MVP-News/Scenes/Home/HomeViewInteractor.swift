//
//  HomeViewInteractor.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation

class HomeViewInteractor {
    private let network: NetworkServiceProtocol
    private let database: DatabaseProtocol
    
    init(network: NetworkServiceProtocol = AlamofireNetworkManager(), database: DatabaseProtocol? = nil) {
        self.network = network
        self.database = database!
    }
    
    func fetchNewsFromNetwork(for type: NewsTypes, onFetch: @escaping ((Result<NewsResponse, Error>)) -> Void) {
        var endpoint: BBCNewsEndpoint = BBCNewsEndpoint.allArticles
        switch type {
        case .allNews:
            endpoint = BBCNewsEndpoint.allArticles
            
        case .healthNews:
            endpoint = BBCNewsEndpoint.health
            
        case .scienceNews:
            endpoint = BBCNewsEndpoint.science
        }
        
        network.fetch(endpoint: endpoint, expectedType: NewsResponse.self) { result in
            switch result {
            case .failure(let error):
                onFetch(.failure(error))
                
            case .success(let response):
                onFetch(.success(response))
            }
        }
    }
    
    func fetchNewsFromDatabase(for type: NewsTypes, onFetch: @escaping ((Result<NewsResponse, Error>)) -> Void) {
    }
}