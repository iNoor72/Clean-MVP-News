//
//  BBCNewsEndpoint.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation
import Alamofire

enum BBCNewsEndpoint {
    case allArticles
    case health
    case science
}

extension BBCNewsEndpoint: Endpoint {
    var parameters: Parameters? {
        return nil
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .allArticles:
            return "/everything/bbc-news.json"
        case .health:
            return "https://saurav.tech/NewsAPI/top-headlines/category/health/gb.json"
        case .science:
            return "https://saurav.tech/NewsAPI/top-headlines/category/science/gb.json"
        }
    }
}

