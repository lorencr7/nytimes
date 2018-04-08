//
//  BasePresenter.swift
//  PBank
//
//  Created by Oscar Manrique on 23/10/17.
//  Copyright (c) 2017 VASS. All rights reserved.
//



protocol BaseInteractorOutputProtocol {
    
}

class BasePresenter
{
    // MARK: - Properties
    weak var baseView: BaseViewControllerProtocol?
    
    init(baseView:BaseViewControllerProtocol) {
        self.baseView = baseView
    }

    // MARK: - BaseInteractorOutputProtocol
    

}
