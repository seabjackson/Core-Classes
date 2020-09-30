//
//  CoreClassesController.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/23/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import Foundation
import Combine

protocol CoreClassesControllerProtocol: class {
    
    var networkController: NetworkControllerProtocol { get }
    
    /// queries the classes available
    func getClasses() -> AnyPublisher<Root, Error>
}


final class CoreClassesController: CoreClassesControllerProtocol {
    var networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController  = networkController
    }
    
    func getClasses() -> AnyPublisher<Root, Error> {
        let apiEndPoint  = APIEndPoint.coreClasses
        return networkController.get(type: Root.self, from: apiEndPoint.url)
    }
    
}
