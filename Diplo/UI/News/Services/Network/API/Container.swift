//
//  Container.swift
//  Diplo
//
//  Created by Björn Waltert on 01.01.20.
//  Copyright © 2020 State Love. All rights reserved.
//

import Foundation

class Container {
    static let jsonDecoder: JSONDecoder = JSONDecoder()
    
    static var weatherJSONDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
    
    /// News API key url: https://newsapi.org
    static let newsAPIKey: String = "0c2a73e6687c445ba8c0bf64260afa5b"
    
    /// Weather API key url: https://darksky.net
    static let weatherAPIKey: String = "YOUR_WEATHER_API_KEY"
}
