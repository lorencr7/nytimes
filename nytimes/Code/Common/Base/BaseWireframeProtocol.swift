//
//  WireframeProtocol.swift
//  PBank
//
//  Created by Oscar Manrique on 23/10/17.
//  Copyright (c) 2017 VASS. All rights reserved.
//

import Foundation

protocol BaseWireframeProtocol: class {
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func present()
    
    func presentModal()
    
    func push()
}

extension BaseWireframeProtocol {
    
    func present() {
        print("ERROR: method not implemented")
    }
    
    func presentModal(){
        print("ERROR: method not implemented")
    }
    
    func push(){
        print("ERROR: method not implemented")
    }
}

