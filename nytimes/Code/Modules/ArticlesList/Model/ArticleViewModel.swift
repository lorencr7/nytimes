//
//  ArticleViewModel.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit

class ArticleViewModel {

    var imageUrl: URL?
    var thumbnail: UIImage?
    var title, author, section: String?
    var publishDate: String?
    
    init(articleModel: ArticleModel) {
        self.imageUrl = articleModel.image
        self.title = articleModel.title
        self.author = articleModel.author
        self.section = articleModel.section
        self.publishDate = articleModel.publishDate?.toString(format: "dd/MM/yyyy")
    }
    
}
