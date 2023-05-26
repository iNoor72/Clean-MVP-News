//
//  NewsResponse.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation

struct NewsResponse: Codable {
    let totalResults: Int
    let articles: [Article]?
}
