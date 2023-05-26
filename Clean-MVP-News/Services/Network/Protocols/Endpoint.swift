//
//  Endpoint.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation
import Alamofire

protocol Endpoint: URLRequestConvertible {
    
    var baseURL: URL { get }
    
    var requestURL: URL { get }
    
    var path: String { get }
    
    var headers: HTTPHeaders { get }

    var parameters: Parameters? { get }
    
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
}

extension Endpoint {
    
    var baseURL: URL {
        guard let url = URL(string: AppConstants.baseURL) else { fatalError("Base URL isn't valid.") }
        return url
    }

    var requestURL: URL {
        baseURL.appendingPathComponent(path)
    }
    
    var headers: HTTPHeaders {
        return ["Connection": "keep-alive"]
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.headers = headers
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        try encoding.encode(urlRequest, with: parameters)
    }
}
