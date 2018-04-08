//
//  ArticlesListPresenter.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


protocol ArticlesListPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func getArticles()
}

protocol ArticlesListInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func showArticles(articles: [ArticleModel])
}


class ArticlesListPresenter: BasePresenter, ArticlesListPresenterProtocol, ArticlesListInteractorOutputProtocol {
    
    // MARK: - Properties
    
    private weak var view: ArticlesListViewControllerProtocol?
    private var interactor: ArticlesListInteractorInputProtocol
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: ArticlesListViewControllerProtocol, interactor: ArticlesListInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
        super.init(baseView: view)
    }
    
    
    // MARK: - ArticlesListPresenterProtocol
    
    func getArticles() {
        self.interactor.getArticles()
    }
    
    // MARK: - ArticlesListPresenterInteractorOutputProtocol
    
    func showArticles(articles: [ArticleModel]) {
        let articlesModel = articles.map { (articleModel) -> ArticleViewModel in
            return ArticleViewModel(articleModel: articleModel)
        }
        self.view?.showArticles(articles: articlesModel)
    }
    
}
