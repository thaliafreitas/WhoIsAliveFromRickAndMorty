//
//  DataStore.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 27/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

class DataStore {
    static let sharedInstance = DataStore()
    var characterDTO : [Result] = []
    
    func saveCharacter (completion: @escaping ([Result]) -> Void) {

        let request = Request<RickAndMortyAPI>()
        request.perform(RickAndMortyAPI.characters) { (character: Result?, error: Errors?) -> (Void) in
            guard let characters = character else { return }

            completion(self.characterDTO)
            print(characters)
        }
    }
    

}
