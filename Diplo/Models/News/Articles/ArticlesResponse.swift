//
//  ArticlesResponse.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let articles: Articles
}
