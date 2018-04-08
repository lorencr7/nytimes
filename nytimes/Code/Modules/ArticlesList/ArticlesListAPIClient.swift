//
//  ArticlesListAPIClient.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//
import Alamofire

protocol ArticlesListAPIClientProtocol: class {
    
    /**
     * Add here your methods for communication DATA_MANAGER -> API_CLIENT
     */
    func getArticles(searchModel: SearchModel, success: @escaping ([ArticleModel]) -> Void, failure: @escaping () -> Void)
}


class ArticlesListAPIClient: BaseAPIClient, ArticlesListAPIClientProtocol {
    
    private static let baseURL = "https://api.nytimes.com/svc/mostpopular/v2"
    private static let apiKey = "32534511931e4dc1b5627b6918ca0d6b"
    
    // MARK: - ArticlesListAPIClientProtocol
    func getArticles(searchModel: SearchModel, success: @escaping ([ArticleModel]) -> Void, failure: @escaping () -> Void) {
        let url = ArticlesListAPIClient.baseURL + "/" + searchModel.typeOfArticle.urlKey + "/all-sections/" + searchModel.period.urlKey + ".json" + "?api-key=" + ArticlesListAPIClient.apiKey
        print(url)
        Alamofire.request(url).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value as? [String: Any] {
                if let results = json["results"] as? [Any] {
                    var articles = [ArticleModel]()
                    for result in results {
                        if let resultDictionary = result as? [String: Any] {
                            var articleModel = ArticleModel()
                            
                            if let author = resultDictionary["source"] as? String {
                                articleModel.author = author
                            }
                            
                            if let title = resultDictionary["title"] as? String {
                                articleModel.title = title
                            }
                            
                            if let section = resultDictionary["section"] as? String {
                                articleModel.section = section
                            }
                            
                            if let publishedDate = resultDictionary["published_date"] as? String {
                                articleModel.publishDate = publishedDate.toDate(with: "yyyy-MM-dd")
                            }
                            
                            
                            articles.append(articleModel)
                        }
                    }
                    success(articles)
                }
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
    }
}






