//
//  FavoriteViewController.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 30/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    let store = APIManager.sharedInstance
    var favCharacters: [Character] = []
    let coreDataManager = CoreDataManager.sharedInstance
    fileprivate let tableView: UITableView = {
        let tableViewCell = UITableView(frame: .zero, style: .plain)
        tableViewCell.translatesAutoresizingMaskIntoConstraints = false
        tableViewCell.register(CardCell.self, forCellReuseIdentifier: "cell")
        tableViewCell.backgroundColor = .backgroundColor
        return tableViewCell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        favCharacters = coreDataManager.fetchCharacters()
        tableView.reloadData()
    }

}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CardCell
            let character = favCharacters[indexPath.row]
        cell?.characterName.text = character.name

        if let image = character.image {
            cell?.characterImage.load(url: image)
        }

        return cell ?? UITableViewCell()
    }

}

extension FavoriteViewController: ViewCode {
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }

    func buildViewHierarchy() {
        view.addSubview(tableView)
    }

    func setupAdditionalConfiguration() {
        return
    }

}
