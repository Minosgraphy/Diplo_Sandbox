//
//  String+Extension.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
