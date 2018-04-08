//
//  String+Extensions.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import Foundation


extension String {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func toDate(with format: String = "ddMMyyyy", localeIdentifier: String = "es_ES") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }

}
