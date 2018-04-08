//
//  BaseWireframe.swift
//  PBank
//
//  Created by Óscar Manrique on 15/11/17.
//  Copyright © 2017 VASS. All rights reserved.
//

import UIKit

class BaseWireframe {
    
    func present(viewController: UIViewController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let window = appDelegate.window
        
//        if let menu = window?.rootViewController as? SlideMenuController {
//            let nav = UINavigationController()
//            nav.viewControllers = [viewController]
//            menu.changeMainViewController(nav, close: true)
//        }
    }
    
    func presentModal(viewController: UIViewController) {
        guard let presentationController = UIApplication.shared.keyWindow?.rootViewController else { return }
        
        let nav = UINavigationController()
        nav.viewControllers = [viewController]
        presentationController.present(nav, animated: true, completion: nil)
    }
        
    func pushFromPresentedViewController(viewController: UIViewController){
      
        guard let nav = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as? UINavigationController else { return }
      
        nav.pushViewController(viewController, animated: true)
    }
    
    func push(viewController: UIViewController) {
        if let nav = UIViewController.getCurrentNavigationController() {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
