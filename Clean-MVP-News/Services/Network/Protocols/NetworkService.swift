//
//  NetworkService.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetch<U: Endpoint, T: Decodable>(endpoint: U, expectedType: T.Type, completion: @escaping (Result<T, Error>) -> ())
}
