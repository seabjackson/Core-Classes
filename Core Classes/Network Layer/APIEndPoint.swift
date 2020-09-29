//
//  APIEndPoint.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/23/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import Foundation

struct APIEndPoint {
    var path: String
    let queryItems: [URLQueryItem] = []
}

/// https://core-class-search.herokuapp.com/classes
extension APIEndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = Constants.URL.scheme
        components.host = Constants.URL.host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure(Constants.URL.invalidURL + "\(components)")
        }
        return url
    }
    
    static var coreClasses: Self {
        return APIEndPoint(path: Constants.URL.path)
    }
}

