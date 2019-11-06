//
//  CustomCellCell.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 26/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation
import UIKit

class CardCell: UITableViewCell {

    lazy var characterImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()

    lazy var characterName: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.adjustsFontForContentSizeCategory = true
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = .textColor
        textView.textAlignment = .justified
        textView.layer.cornerRadius = 12
        return textView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        self.selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has ot been implemented")
    }

}

extension CardCell: ViewCode {

    func setupConstraints() {
            NSLayoutConstraint.activate([
                characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
                characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                characterImage.heightAnchor.constraint(equalToConstant: 300),
                characterName.heightAnchor.constraint(equalToConstant: 30),
                characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -16),
                characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
                ])
    }

    func buildViewHierarchy() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
    }

    func setupAdditionalConfiguration() {
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

