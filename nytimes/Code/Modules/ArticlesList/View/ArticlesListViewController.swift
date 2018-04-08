//
//  ArticlesListViewController.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


import UIKit


protocol ArticlesListViewControllerProtocol: BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: ArticlesListPresenterProtocol)
}


class ArticlesListViewController: BaseViewController, ArticlesListViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: ArticlesListPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - ArticlesListViewProtocol
    
    func set(presenter: ArticlesListPresenterProtocol) {
        
        self.presenter = presenter
    }
}
