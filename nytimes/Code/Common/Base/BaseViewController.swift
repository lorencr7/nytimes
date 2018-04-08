//
//  BaseViewController.swift
//  PBank
//
//  Created by Oscar Manrique on 23/10/17.
//  Copyright (c) 2017 VASS. All rights reserved.
//


import UIKit

protocol BaseViewControllerProtocol: class  {
    
    func popToPrevious()
}


class BaseViewController: UIViewController, BaseViewControllerProtocol{
    
    // MARK: Properties
    
    public var isLoading = true
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    
        
    // MARK: - BaseViewControllerProtocol
    

    
    func popToPrevious() {
        if let nav = self.navigationController { nav.popViewController(animated: true) }
    }
    
}

extension UIViewController {
    
    static func getCurrentNavigationController() -> UINavigationController? {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        let rootVc = window?.rootViewController
        
        if let vc = rootVc, let nav = vc.presentedViewController as? UINavigationController {
            return nav
        }
        return nil
    }
    
    
}
 
