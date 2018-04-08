//
//  SearchConfigWireframe.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


import UIKit


class SearchConfigWireframe: BaseWireframe, BaseWireframeProtocol {
    
    // MARK: - Properties
    
    private var viewController: SearchConfigViewController {
        
        // Generating module components
        let viewController: SearchConfigViewController = SearchConfigViewController(nibName: "SearchConfigView", bundle: nil)
        let interactor: SearchConfigInteractor = createInteractor(with: dataManager)
        let presenter: SearchConfigPresenter = createPresenter(with: viewController, interactor: interactor)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var apiClient: SearchConfigAPIClient{
        return SearchConfigAPIClient()
    }
    
    private var dataManager: SearchConfigDataManager{
        return SearchConfigDataManager(apiClient: apiClient)
    }
    
    private var articlesListWireframe: ArticlesListWireframe {
        return ArticlesListWireframe()
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor(with dataManager: SearchConfigDataManagerProtocol) -> SearchConfigInteractor {
        return SearchConfigInteractor(dataManager: dataManager)
    }
    
    private func createPresenter(with view: SearchConfigViewController, interactor: SearchConfigInteractor ) -> SearchConfigPresenter {
        return SearchConfigPresenter(view: view, interactor: interactor, articlesListWireframe: articlesListWireframe)
    }
    
    // MARK: - BaseWireframeProtocol
    
    func present() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        // We pass an empty viewController as rightMenu to limit the missuse of the application
        

        if appDelegate.window == nil {
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.backgroundColor = .white
        appDelegate.window?.makeKeyAndVisible()
    }
}






