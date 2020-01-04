//
//  APIProviderErrors.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Foundation

enum APIProviderErrors: LocalizedError {
    case invalidURL
    case dataNil
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
            case .dataNil:
                return "Empty data.".localized()
            case .decodingError:
                return "Data has invalid format.".localized()
            default:
                return "Something goes wrong.".localized()
        }
    }
}
