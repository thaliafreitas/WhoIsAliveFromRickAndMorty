//
//  CoreDataManager.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 30/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    var characters: [Character] = []

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "WhoIsAliveFromRickAndMorty")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private func getContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveCharacter(withName name: String = "", withStatus status: String  = "", withSpecies species: String = "", withType type: String = "", withGender gender: String = "", withImage image: URL, withEpisode episode: String, andCreated created: String = "") {

        let context = getContext()
        let character = Character(context: context)

        character.name = name
        character.status = status
        character.species = species
        character.type = type
        character.episode = episode
        character.gender = gender
        character.image = image
        character.created = created

        do {
            try context.save()
            print("Context Saved")
        } catch {
            fatalError("Failure to get context\(error)")
        }
    }

    func fetchCharacters() -> [Character] {
        let context = getContext()
        let charactersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Character")

        do {
            guard let fetchedCharacters = try context.fetch(charactersFetch) as? [Character] else { return [] }

            return fetchedCharacters

        } catch {
            fatalError("Failed to fetch character: \(error)")
        }
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Context Saved")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func resetCoreData() {
        let context = getContext()
        let charactersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Character")

        do {
            guard let fetchedCharacters = try context.fetch(charactersFetch) as? [Character] else { return }
            for characters in fetchedCharacters {
                context.delete(characters)
            }
            try context.save()
            self.characters = []
        } catch {
            fatalError("Failed to fetch character: \(error)")
        }
    }

}
