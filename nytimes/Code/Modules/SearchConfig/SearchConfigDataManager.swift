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
    
    func getTypeOfArticles() -> [TypeOfArticle]
    func getPeriods() -> [Period]
}




class SearchConfigDataManager: BaseDataManager, SearchConfigDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: SearchConfigAPIClientProtocol
    
    private let typeOfArticles: [TypeOfArticle] = [.mostEmailed,.mostShared,.mostViewed]
    
    private let periods: [Period] = [.oneDay,.sevenDays,.thirtyDays]
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: SearchConfigAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - SearchConfigDataManagerProtocol
    
    func getTypeOfArticles() -> [TypeOfArticle] {
        return self.typeOfArticles
    }
    
    func getPeriods() -> [Period] {
        return self.periods
    }
}






