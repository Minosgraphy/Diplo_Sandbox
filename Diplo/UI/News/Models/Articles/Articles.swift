//
//  Articles.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Foundation

typealias Articles = [Article]

struct Article: Codable, Hashable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: URL
    let urlToImage: String?
}
