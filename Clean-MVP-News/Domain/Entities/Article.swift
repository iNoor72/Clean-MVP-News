//
//  Article.swift
//  Clean-MVP-News
//
//  Created by Noor Walid on 26/05/2023.
//

import Foundation

struct Article: Codable {
    let author: String?
    let title: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
