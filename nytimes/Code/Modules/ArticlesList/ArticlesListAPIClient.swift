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
    
    // MARK: - ArticlesListAPIClientProtocol
    func getArticles(searchModel: SearchModel, success: @escaping ([ArticleModel]) -> Void, failure: @escaping () -> Void) {
        
        Alamofire.request("https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=32534511931e4dc1b5627b6918ca0d6b").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
    }
}






