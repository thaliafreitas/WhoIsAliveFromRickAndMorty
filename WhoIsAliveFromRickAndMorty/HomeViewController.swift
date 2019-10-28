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
    let store = DataStore.sharedInstance

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionViewCell = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewCell.translatesAutoresizingMaskIntoConstraints = false
        collectionViewCell.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionViewCell.backgroundColor = .green
        return collectionViewCell
    }()

    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupConstraints()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupConstraints()
        DataStore().saveCharacter { (cha) in
            self.store.characterDTO = cha
            self.collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.store.characterDTO.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell else {fatalError("Misconfigured cell type")}
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
