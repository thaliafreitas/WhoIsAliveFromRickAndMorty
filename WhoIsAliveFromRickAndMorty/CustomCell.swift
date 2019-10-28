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

    fileprivate let imageCell: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
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
        textView.textColor = .black
        textView.textAlignment = .justified
        textView.backgroundColor = .clear
        return textView
    }()

    func setupConstraints() {
        imageCell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        characterName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        characterName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageCell)
        contentView.addSubview(characterName)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has ot been implemented")
    }

}
