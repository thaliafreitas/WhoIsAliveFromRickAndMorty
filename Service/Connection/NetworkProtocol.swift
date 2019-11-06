//
//  NetworkProtocol.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 26/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    associatedtype EndPoint: EndPointType
    func perform<T: Decodable>(_ route: EndPoint, queryItem: [String: Any]?, completion: @escaping (T?, Errors?) -> (Void))
    func cancel()
}
