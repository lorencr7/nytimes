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

}
