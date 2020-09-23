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
    func getClasses() -> AnyPublisher<CoreClasses, Error>
}


final class CoreClassesController: CoreClassesControllerProtocol {
    var networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController  = networkController
    }
    
    func getClasses() -> AnyPublisher<CoreClasses, Error> {
        let apiEndPoint  = APIEndPoint.coreClasses
        return networkController.get(type: CoreClasses.self, from: apiEndPoint.url)
    }
    
    
}
