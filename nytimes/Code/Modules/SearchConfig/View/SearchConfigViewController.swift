//
//  SearchConfigViewController.swift
//  nytimes
//
//  Created by lorenzo villarroel perez on 8/4/18.
//  Copyright (c) 2018 lorenzo villarroel perez. All rights reserved.
//


import UIKit


protocol SearchConfigViewControllerProtocol: BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: SearchConfigPresenterProtocol)
}


class SearchConfigViewController: BaseViewController, SearchConfigViewControllerProtocol {
  
    // MARK: - Properties
    
    private var presenter: SearchConfigPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configViews()
    }
    
    
    // MARK: - SearchConfigViewProtocol
    
    func set(presenter: SearchConfigPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    // MARK: - Private methods
    
    private func configViews() {
        
        self.title = "Search".localized
    }
    
}
