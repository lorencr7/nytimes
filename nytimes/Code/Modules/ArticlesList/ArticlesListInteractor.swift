//
//  ArticlesListInteractor.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


protocol ArticlesListInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: ArticlesListInteractorOutputProtocol)
    func getArticles()
}


class ArticlesListInteractor: ArticlesListInteractorInputProtocol {
    
    // MARK: - Properties
    
    private weak var presenter: ArticlesListInteractorOutputProtocol?
    private var dataManager: ArticlesListDataManagerProtocol
    
    
    // MARK: - Object lifecycle
    
    init(dataManager: ArticlesListDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: - ArticlesListInteractorInputProtocol
    
    func set(presenter: ArticlesListInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
    func getArticles() {
        self.dataManager.getArticles(success: { (articles: [ArticleModel]) in
            self.presenter?.showArticles(articles: articles)
        }) { 
            //TODO manage error
        }
    }
    
}
