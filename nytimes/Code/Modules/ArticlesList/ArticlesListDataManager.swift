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
}


class ArticlesListDataManager: BaseDataManager, ArticlesListDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: ArticlesListAPIClientProtocol
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: ArticlesListAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - ArticlesListDataManagerProtocol
}






