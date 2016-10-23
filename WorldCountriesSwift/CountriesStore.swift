//
//  CountriesStore.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 16/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import Foundation

class CountriesStore {

    // Shared Instance
    static let sharedStore = CountriesStore()

    private var countryArray: [SimpleCountry] = []

    // MARK: -GET COUNTRIES
    // Method to get the country names and country codes.
    func countryData() -> [SimpleCountry] {

        // if array already contains data then just return it.
        if !countryArray.isEmpty {

            return countryArray
        }
        for countryCode in NSLocale.isoCountryCodes {

            var countryName: String? = NSLocale().displayName(forKey: .countryCode, value: countryCode)
            if countryName != nil {

            } else {

                countryName = NSLocale(localeIdentifier: "en_US").displayName(forKey: .countryCode, value: countryCode)
            }

            let simpleCountry = SimpleCountry(countryName: countryName!, countryCode: countryCode)
            countryArray.append(simpleCountry)
        }
        countryArray = countryArray.sorted { $0.countryName < $1.countryName}

        return countryArray
    }

}
