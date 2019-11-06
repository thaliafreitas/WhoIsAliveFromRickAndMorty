//
//  UIolor+customColors.swift
//  WhoIsAliveFromRickAndMorty
//
//  Created by Thalia Freitas on 06/11/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    @nonobjc class var dark: UIColor {
        return UIColor(red: 45.0 / 255.0, green: 37.0 / 255.0, blue: 61.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var tabBarColor: UIColor {
        return UIColor(named: "tabBarColor") ?? .white
    }

    @nonobjc class var tabBarItemColor: UIColor {
        return UIColor(named: "tabBarItemColor") ?? .white
    }

    @nonobjc class var textColor: UIColor {
        return UIColor(named: "textColor") ?? .black
    }

    @nonobjc class var backgroundColor: UIColor {
        return UIColor(named: "backgroundColor") ?? .white
    }

    @nonobjc class var textLabelBackgroundColor: UIColor {
        return UIColor(red: 168.0 / 255.0, green: 169.0 / 255.0, blue: 171.0 / 255.0, alpha: 1.0)
    }

}
