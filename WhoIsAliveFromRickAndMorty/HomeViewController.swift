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
    private var filteredCharacters = [Result?]()
    private var characters = [Result]()

    fileprivate let tableView: UITableView = {
        let tableViewCell = UITableView(frame: .zero, style: .plain)
        tableViewCell.translatesAutoresizingMaskIntoConstraints = false
        tableViewCell.register(CardCell.self, forCellReuseIdentifier: "cell")
        tableViewCell.backgroundColor = .backgroundColor
        return tableViewCell
    }()

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Characters"
        definesPresentationContext = true
        return searchController
    }()

    private var searchBarIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    private var isFiltering: Bool {
           return searchController.isActive && !searchBarIsEmpty
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupView()

        store.loadCharacter { (results: [Result]) in
            self.store.characterDTO = results
            self.tableView.reloadData()
        }
        self.searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController

    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.characterDTO.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let customCell = cell as? CardCell {
            let character = store.characterDTO[indexPath.row]
            customCell.characterName.text = character.name
            customCell.characterImage.load(url: character.image)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: 30, height: 120))
        let backgroundView = UIView()
        backgroundView.backgroundColor = .backgroundColor
        headerView.backgroundView = backgroundView
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexSelect = indexPath.row
        let detailsVC = DetailsViewController()
        detailsVC.character = store.characterDTO[indexSelect]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }

}

extension HomeViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }

    func setupAdditionalConfiguration() {
        return
    }

    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }

}

// MARK: - UISearchControllerDelegate
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
        }
    }

    private func filterContent(for searchText: String) {
        store.filterCharacter(withValue: searchText) { (results: [Result]) in
            self.store.characterDTO = results
            self.tableView.reloadData()
        }
    }

}
