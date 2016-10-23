//
//  SimpleCountry.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 16/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation

struct SimpleCountry {
    // Country will always have a name
    var countryName: String
    var countryCode: String

    init(countryName: String, countryCode: String) {

        self.countryName = countryName
        self.countryCode = countryCode
    }
}
