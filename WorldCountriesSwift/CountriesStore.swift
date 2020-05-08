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
    // We only have one network request at a time, so using a singleton instance of network manager
    private var networkManager = NetworkDataManager.sharedNetworkmanager

    // MARK: - GET COUNTRIES

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
        countryArray = countryArray.sorted { $0.countryName < $1.countryName }

        return countryArray
    }

    func fetchDetailsOfCountryWith(code: String, completion: @escaping (_ data: [GenericCellData], _ error: Error?) -> Void) {
        let url = createURLFromParameters(parameters: [:], pathparam: code)
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 2.0)

        networkManager.fetchDataWithUrlRequest(urlRequest) { [weak self] _, anyData in
            if let countryDict = anyData as? [String: Any] {
                completion((self?.countryDataWith(countryDict))!, nil)
            }
            print(anyData)
        }
    }

    private func countryDataWith(_ dictionary: [String: Any]) -> [GenericCellData] {
        var countryDetailsArray = [GenericCellData]()

        for key in dictionary.keys {
            if let value = dictionary[key] as? String {
                let cellData = createGenericCellData(with: key, and: value)
                countryDetailsArray.append(cellData)
            }
        }
        return countryDetailsArray
    }

    private func createGenericCellData(with key: String, and detail: String) -> GenericCellData {
        let celldata = GenericCellData(with: key, and: detail)
        return celldata
    }

    private func createURLFromParameters(parameters: [String: Any], pathparam: String?) -> URL {
        var components = URLComponents()
        components.scheme = Constants.CountryAPIDetails.APIScheme
        components.host = Constants.CountryAPIDetails.APIHost
        components.path = Constants.CountryAPIDetails.APIPath
        if let paramPath = pathparam {
            components.path = Constants.CountryAPIDetails.APIPath + "\(paramPath)"
        }
        if !parameters.isEmpty {
            components.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }

        return components.url!
    }
}
