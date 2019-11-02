//
//  FavoriteViewController.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 30/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

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

        // Do any additional setup after loading the view.
    }

}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell
            else { return UICollectionViewCell()}
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width
        return CGSize(width: collectionViewSize, height: collectionViewSize / 2)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCell else { return }

    }
}

extension FavoriteViewController: ViewCode {
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }

    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }

    func setupAdditionalConfiguration() {
        return
    }

}