//
//  SearchConfigDataManager.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


protocol SearchConfigDataManagerProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> DATA_MANAGER
     */
}


class SearchConfigDataManager: BaseDataManager, SearchConfigDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: SearchConfigAPIClientProtocol
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: SearchConfigAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - SearchConfigDataManagerProtocol
}






