//
//  CustomCellCell.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 26/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UICollectionViewCell {

    lazy var characterImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.backgroundColor = .blue
        return image
    }()

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has ot been implemented")
    }

}

extension CustomCell: ViewCode {

    func setupConstraints() {
        characterImage.heightAnchor.constraint(equalToConstant: contentView.frame.height).isActive = true
        characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        characterName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    func buildViewHierarchy() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
    }

    func setupAdditionalConfiguration() {
//        let request = Request<RickAndMortyAPI>()
//        request.peform(
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

