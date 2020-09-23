//
//  NetworkControllerProtocol.swift
//  Core Classes
//
//  Created by Seab Jackson on 9/23/20.
//  Copyright © 2020 Seab Jackson. All rights reserved.
//

import Foundation
import Combine

protocol NetworkControllerProtocol: class {
    func get<T>(type: T.Type, from url: URL) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetworkController: NetworkControllerProtocol {
    func get<T: Decodable>(type: T.Type, from url: URL) -> AnyPublisher<T, Error> {
        var urlRequest = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
