//
//  UITableViewCell+ReuseIdentifier.swift
//  Tradernet Quotes
//
//  Created by Zafar Ivaev on 23/12/22.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
