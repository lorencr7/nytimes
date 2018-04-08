//
//  ArticlesListWireframe.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


import UIKit


class ArticlesListWireframe: BaseWireframe, BaseWireframeProtocol {
    
    // MARK: - Properties
    
    private var viewController: ArticlesListViewController {
        
        // Generating module components
        let viewController: ArticlesListViewController = ArticlesListViewController(nibName: "ArticlesListView", bundle: nil)
        let interactor: ArticlesListInteractor = createInteractor(with: dataManager)
        let presenter: ArticlesListPresenter = createPresenter(with: viewController, interactor: interactor)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var apiClient: ArticlesListAPIClient{
        return ArticlesListAPIClient()
    }
    
    private var dataManager: ArticlesListDataManager{
        return ArticlesListDataManager(apiClient: apiClient)
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor(with dataManager: ArticlesListDataManagerProtocol) -> ArticlesListInteractor {
        return ArticlesListInteractor(dataManager: dataManager)
    }
    
    private func createPresenter(with view: ArticlesListViewController, interactor: ArticlesListInteractor ) -> ArticlesListPresenter {
        return ArticlesListPresenter(view: view, interactor: interactor)
    }
    
    // MARK: - BaseWireframeProtocol
    
    func present() {
        
    }
}






