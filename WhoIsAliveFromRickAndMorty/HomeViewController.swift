//
//  HomeViewViewController.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 26/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    let store = APIManager.sharedInstance

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionViewCell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewCell.translatesAutoresizingMaskIntoConstraints = false
        collectionViewCell.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionViewCell.backgroundColor = .green
        return collectionViewCell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupView()
        store.saveCharacter { (results: [Result]) in
            self.store.characterDTO = results
            self.collectionView.reloadData()
        }
    }

//    func showDetailsCollectionView(of Character: UIImage) {
//
//    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.characterDTO.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let customCell = cell as? CustomCell {
            let character = store.characterDTO[indexPath.row]
            customCell.characterName.text = character.name
            customCell.characterImage.load(url: character.image)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width
        return CGSize(width: collectionViewSize, height: collectionViewSize / 2)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let customCell = cell as? CustomCell {

            let character = store.characterDTO[indexPath.row]
            customCell.characterName.text = character.name
            customCell.characterImage.load(url: character.image)

        }
    }
}

extension HomeViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }

    func setupAdditionalConfiguration() {
        return
    }

    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }

}



