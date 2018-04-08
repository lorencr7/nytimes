//
//  SearchConfigInteractor.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


protocol SearchConfigInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: SearchConfigInteractorOutputProtocol)
    func getTypeOfArticles() -> [TypeOfArticle]
    func getPeriods() -> [Period]
    func typeOfArticlesChanged(typeOfArticle: TypeOfArticle)
}


class SearchConfigInteractor: SearchConfigInteractorInputProtocol {
    
    // MARK: - Properties
    
    private weak var presenter: SearchConfigInteractorOutputProtocol?
    private var dataManager: SearchConfigDataManagerProtocol
    
    
    // MARK: - Object lifecycle
    
    init(dataManager: SearchConfigDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: - SearchConfigInteractorInputProtocol
    
    func set(presenter: SearchConfigInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
    func getTypeOfArticles() -> [TypeOfArticle] {
        return self.dataManager.getTypeOfArticles()
    }
    
    func getPeriods() -> [Period] {
        return self.dataManager.getPeriods()
    }
    
    func typeOfArticlesChanged(typeOfArticle: TypeOfArticle) {
        switch typeOfArticle {
        case .mostShared:
            self.presenter?.showArticleSource()
        default:
            self.presenter?.hideArticleSource()
        }

    }
}
