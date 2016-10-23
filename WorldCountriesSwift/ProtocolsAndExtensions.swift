//
//  ProtocolsAndExtensions.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 22/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation
import UIKit

//From :https://gist.github.com/gonzalezreal/92507b53d2b1e267d49a
protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView {
}
