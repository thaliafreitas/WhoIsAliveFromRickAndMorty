//
//  NetworkEndPoint.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 25/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation
// MARK: Enum

/** Protocol to API url and path management */
public protocol EndPointType {
    var url: URL { get }
    var path: String { get }
}
