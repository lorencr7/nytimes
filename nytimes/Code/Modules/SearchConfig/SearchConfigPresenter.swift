//
//  SearchConfigPresenter.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


protocol SearchConfigPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    func getTypeOfArticles()
    func getPeriods()
    func typeOfArticlesChanged(typeOfArticle: String)
    func searchPressed(typeOfArticle: String, period: String, sharedFacebook: Bool, sharedTwitter: Bool)
}

protocol SearchConfigInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func showArticleSource()
    func hideArticleSource()
    
}


class SearchConfigPresenter: BasePresenter, SearchConfigPresenterProtocol, SearchConfigInteractorOutputProtocol {
    
    // MARK: - Properties
    
    private weak var view: SearchConfigViewControllerProtocol?
    private var interactor: SearchConfigInteractorInputProtocol
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: SearchConfigViewControllerProtocol, interactor: SearchConfigInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
        super.init(baseView: view)
    }
    
    
    // MARK: - SearchConfigPresenterProtocol
    
    func getTypeOfArticles() {
        let typeOfArticles = self.interactor.getTypeOfArticles()
        let processedTypeOfArtices = typeOfArticles.map { (typeOfArticle) -> String in
            return typeOfArticle.rawValue
        }
        self.view?.showTypeOfArticles(typeOfArticles: processedTypeOfArtices)
    }
    
    func getPeriods() {
        let periods = self.interactor.getPeriods()
        let processedPeriods = periods.map { (period) -> String in
            return period.rawValue
        }
        self.view?.showPeriods(periods: processedPeriods)
    }
    
    func typeOfArticlesChanged(typeOfArticle: String) {
        if let typeOfArticle = TypeOfArticle(rawValue: typeOfArticle) {
            self.interactor.typeOfArticlesChanged(typeOfArticle: typeOfArticle)
        }
    }
    
    func searchPressed(typeOfArticle: String, period: String, sharedFacebook: Bool, sharedTwitter: Bool) {
        if let typeOfArticle = TypeOfArticle(rawValue: typeOfArticle),
            let period = Period(rawValue: period) {
            let searchModel = SearchModel(typeOfArticle: typeOfArticle, period: period, sharedFacebook: sharedFacebook, sharedTwitter: sharedTwitter)
            print(searchModel)
        }
    }
    
    // MARK: - SearchConfigPresenterInteractorOutputProtocol
    
    func showArticleSource() {
        self.view?.showArticleSource()
    }
    
    func hideArticleSource() {
        self.view?.hideArticleSource()
    }
    
}
