//
//  APIManager.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 27/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

/** Class to manipulate  API data and save into array */

class APIManager {
    static let sharedInstance = APIManager()

    var characterDTO: [Result] = []

    func loadCharacter (completion: @escaping ([Result]) -> Void) {

        let request = Request<RickAndMortyAPI>()
        request.perform(RickAndMortyAPI.characters) { (character: Welcome?, _: Errors?) -> (Void) in
            guard let characters = character else { return }
            completion(characters.results)

        }

    }

    func filterCharacter (withValue: String, completion: @escaping ([Result]) -> Void) {

        let request = Request<RickAndMortyAPI>()
        request.perform(RickAndMortyAPI.characters,
                        queryItem: ["name": withValue]) { (character: Welcome?, _: Errors?) -> (Void) in
            guard let characters = character else { return }
            completion(characters.results)

        }

    }

}
