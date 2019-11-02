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

    lazy var characterName: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.adjustsFontForContentSizeCategory = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = .white
        textView.textAlignment = .justified
        textView.backgroundColor = .black
        textView.layer.cornerRadius = 12
        return textView
    }()

    lazy var characterGender: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.adjustsFontForContentSizeCategory = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = .white
        textView.textAlignment = .justified
        textView.backgroundColor = .black
        textView.layer.cornerRadius = 12
        return textView
    }()

    lazy var characterSpecie: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.adjustsFontForContentSizeCategory = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = .white
        textView.textAlignment = .justified
        textView.backgroundColor = .black
        textView.layer.cornerRadius = 12
        return textView
    }()

    lazy var characterCreated: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.adjustsFontForContentSizeCategory = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = .white
        textView.textAlignment = .justified
        textView.backgroundColor = .black
        textView.layer.cornerRadius = 12
        return textView
    }()

    lazy var characterEpisode: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.adjustsFontForContentSizeCategory = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = .white
        textView.textAlignment = .justified
        textView.backgroundColor = .black
        textView.layer.cornerRadius = 12
        return textView
    }()

//    lazy var scrollCollectionDetail: UIScrollView {
//
//    }()

    fileprivate let characterImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.backgroundColor = .blue
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension DetailsViewController: ViewCode {
    func buildViewHierarchy() {
        return
    }

    func setupConstraints() {
        return
    }

    func setupAdditionalConfiguration() {
        return
    }
}
