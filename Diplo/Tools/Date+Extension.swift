//
//  Date+Extension.swift
//  Diplo
//
//  Created by Björn Waltert on 31.12.19.
//  Copyright © 2019 State Love. All rights reserved.
//

import Foundation

extension Date {
    func hour() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: self)
    }
    
    func day() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: self)
    }
}
