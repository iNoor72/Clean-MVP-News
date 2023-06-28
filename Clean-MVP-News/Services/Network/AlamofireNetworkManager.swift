//
//  AlamofireNetworkManager.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation
import Alamofire

final class AlamofireNetworkManager: NetworkServiceProtocol {
    func fetch<U: Endpoint, T: Decodable>(endpoint: U, expectedType: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        guard let requestURL = try? endpoint.asURLRequest() else { return }
        
        AF.request(requestURL).validate().responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let data):
                completion(.success(data))
            }
        }
    }
    
    static func fetchImage(with URL: URL) -> Data? {
        return try? Data(contentsOf: URL)
    }
}
