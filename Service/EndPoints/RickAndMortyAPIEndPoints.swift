//
//  RickAndMortyAPIEndPoints.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 25/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation

enum RickAndMortyAPI {
    case characters
    case location
    case episodes
}

extension RickAndMortyAPI: EndPointType {

    var apiAdress: String {
            return "https://rickandmortyapi.com/api"
    }

    var url: URL {

        guard let url = URL(string: self.path) else
        { return URL(fileURLWithPath: "https://rickandmortyapi.com/api")}
        return url

    }

    var path: String {

        switch self {

        case .characters:
            return self.apiAdress + "/character"
        case .location:
            return self.apiAdress + "/location"
        case .episodes:
            return self.apiAdress + "/episodes"
        }
    }

}
