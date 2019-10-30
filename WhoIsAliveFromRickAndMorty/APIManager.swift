//
//  APIManager.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 27/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

/** Class to manipulate  API data */

class APIManager {
    static let sharedInstance = APIManager()

    var characterDTO: [Result] = []

    func saveCharacter (completion: @escaping ([Character?]) -> Void) {

        let request = Request<RickAndMortyAPI>()
        request.perform(RickAndMortyAPI.characters) { (character: Welcome?, error: Errors?) -> (Void) in
            guard let characters = character else
{ return }
            print(characters)

        }

    }

}
