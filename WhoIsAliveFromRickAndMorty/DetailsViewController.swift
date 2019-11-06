//
//  DetailsViewController.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 31/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let store = APIManager.sharedInstance
    var character: Result?
    var favorites: [Result] = []

    lazy var characterName: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.textColor = .textColor
        textLabel.textAlignment = .justified
        textLabel.layer.cornerRadius = 12
        return textLabel
    }()

    lazy var favButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleFavTap(_:)), for: .touchUpInside)
        button.tintColor = .blue
        return button
    }()

    lazy var characterImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()

    lazy var characterGender: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.textColor = .textColor
        textLabel.textAlignment = .justified
        textLabel.layer.cornerRadius = 12
        return textLabel
    }()

    lazy var characterSpecie: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.textColor = .textColor
        textLabel.textAlignment = .justified
        textLabel.layer.cornerRadius = 12
        return textLabel
    }()

    lazy var characterCreated: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.textColor = .textColor
        textLabel.textAlignment = .justified
        textLabel.layer.cornerRadius = 12
        return textLabel
    }()

    lazy var characterEpisode: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.adjustsFontForContentSizeCategory = true
        textLabel.textColor = .textColor
        textLabel.textAlignment = .justified
        textLabel.layer.cornerRadius = 12
        return textLabel
    }()

    @objc func handleFavTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let character = self.character else {return}
        characterImage.load(url: character.image)
        characterCreated.text = character.created
        characterName.text = character.name
        CoreDataManager.sharedInstance.saveCharacter(withName: character.name,
                                                     withImage: character.image,
                                                     withEpisode: character.created)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        guard let character = self.character else {return}
        characterImage.load(url: character.image)
        characterCreated.text = character.created
        characterName.text = character.name
        characterGender.text = character.gender.rawValue
        characterSpecie.text = character.species
        setupView()
        store.loadCharacter { (results: [Result]) in
            self.store.characterDTO = results
        }
    }

}

extension DetailsViewController: ViewCode {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        characterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        characterImage.heightAnchor.constraint(equalToConstant: 300),
        characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 8),
        characterName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        characterName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        characterGender.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
        characterGender.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        characterGender.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        characterSpecie.topAnchor.constraint(equalTo: characterGender.bottomAnchor, constant: 8),
        characterSpecie.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        characterSpecie.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
        favButton.topAnchor.constraint(equalTo: characterSpecie.bottomAnchor, constant: 16)
        ])
    }

    func buildViewHierarchy() {
        view.addSubview(characterName)
        view.addSubview(characterImage)
        view.addSubview(characterGender)
        view.addSubview(characterSpecie)
        view.addSubview(favButton)
    }

    func setupAdditionalConfiguration() {
        return
    }
}

