//
//  SearchModel.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import Foundation

enum TypeOfArticle: String {
    case mostEmailed = "Most Emailed"
    case mostShared = "Most Shared"
    case mostViewed = "Most Viewed"
}

enum Period: String {
    case oneDay = "1 day"
    case sevenDays = "7 days"
    case thirtyDays = "30 days"
}

struct SearchModel {
    var typeOfArticle: TypeOfArticle
    var period: Period
    var sharedFacebook: Bool?
    var sharedTwitter: Bool?
    
    init(typeOfArticle: TypeOfArticle, period: Period, sharedFacebook: Bool, sharedTwitter: Bool ) {
        self.typeOfArticle = typeOfArticle
        self.period = period
        if typeOfArticle == .mostShared {
            self.sharedFacebook = sharedFacebook
            self.sharedTwitter = sharedTwitter
        }
    }
}
