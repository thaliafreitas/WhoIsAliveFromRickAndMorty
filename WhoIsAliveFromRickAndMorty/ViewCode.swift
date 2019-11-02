//
//  ViewCode.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 30/10/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
