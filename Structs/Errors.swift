//
//  Errors.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 25/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation
// MARK: Enum

/** Enum responsible to handling possible request errors */
enum Errors: Error {
    case invalidURL
    case failRequest
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .failRequest:
            return "Applicantion cannot request external data"
        }
    }
}
