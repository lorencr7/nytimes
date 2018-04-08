//
//  Date+Extensions.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(format: String, localeIdentifier: String = "es_ES") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
