//
//  ArticlesListDataManager.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


protocol ArticlesListDataManagerProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> DATA_MANAGER
     */
    func getArticles(success: @escaping ([ArticleModel]) -> Void, failure: @escaping () -> Void)
}


class ArticlesListDataManager: BaseDataManager, ArticlesListDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: ArticlesListAPIClientProtocol
    private var searchModel: SearchModel?
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: ArticlesListAPIClientProtocol, searchModel: SearchModel?) {
        
        self.apiClient = apiClient
        self.searchModel = searchModel
    }
    
    
    // MARK: - ArticlesListDataManagerProtocol
    
    func getArticles(success: @escaping ([ArticleModel]) -> Void, failure: @escaping () -> Void) {
        if let searchModel = self.searchModel {
            self.apiClient.getArticles(searchModel: searchModel,success: success, failure: failure)
        }
    }
}






