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
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "core-class-search.herokuapp.com"
//        components.path = path
//        components.queryItems = queryItems
        
        guard let url = URL(string: "https://core-class-search.herokuapp.com/classes") else {
            preconditionFailure("The URL has Invalid URL Components: ")
        }
        print("the  url is \(url)")
        return  url
    }
    
    static var coreClasses: Self {
        return APIEndPoint(path: "/classes")
    }
}

