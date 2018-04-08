//
//  ArticlesListMock.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright © 2018 lorenzo villarroel perez. All rights reserved.
//

import UIKit

class ArticlesListMock: ArticlesListAPIClientProtocol {

    func getArticles(searchModel: SearchModel, success: @escaping ([ArticleModel]) -> Void, failure: @escaping () -> Void) {
        
        var articles = [ArticleModel]()
        
        for i in 0...20 {
            var articleModel = ArticleModel()
            articleModel.image = URL(string: "https://static01.nyt.com/images/2018/04/04/autossell/04xp-shooting-1/merlin_136350525_ae053f13-f258-48ca-8ae1-93bae7c3e934-thumbStandard.jpg")
            articleModel.author = "author" + String(i)
            articleModel.section = "section" + String(i)
            articleModel.title = "title" + String(i)
            articleModel.publishDate = Date()
            articles.append(articleModel)
        }
        success(articles)
        
    }
    
}
