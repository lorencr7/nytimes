//
//  BaseWireframe.swift
//  PBank
//
//  Created by Óscar Manrique on 15/11/17.
//  Copyright © 2017 VASS. All rights reserved.
//

import UIKit

class BaseWireframe {
    
    func push(viewController: UIViewController) {
        if let nav = UIViewController.getCurrentNavigationController() {
            nav.pushViewController(viewController, animated: true)
        }
    }
}
