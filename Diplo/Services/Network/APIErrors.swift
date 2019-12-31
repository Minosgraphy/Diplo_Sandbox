//
//  APIErrors.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Foundation

enum APIErrors: Int, LocalizedError {
    case badRequest = 400
    case unAuthorized = 401
    case tooManyRequests = 429
    case serverError = 500
    
    var errorDescription: String? {
        switch self {
            case .tooManyRequests:
                return "You made too many requests within a window of time and have been rate limited. Back off for a while.".localized()
            case .serverError:
                return "Server error.".localized()
            default:
                return "Something goes wrong.".localized()
        }
    }
}
