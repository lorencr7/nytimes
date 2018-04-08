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
}

protocol SearchConfigInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
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
    
    
    
    // MARK: - SearchConfigPresenterInteractorOutputProtocol
    
    
}
