//
//  CountryDataSource.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 22/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountryDataSource<ItemsType, CellType:UITableViewCell>: NSObject, UITableViewDataSource {

    typealias ConfigureCellClosure = (_ item: ItemsType, _ cell: CellType) -> Void
    private var items: [ItemsType]
    private let identifier: String
    private var configureCellClosure: ConfigureCellClosure


    init(withData items: [ItemsType], andId identifier: String, withConfigBlock config:@escaping ConfigureCellClosure) {

        self.identifier = identifier
        self.items      = items
        self.configureCellClosure = config
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! CellType
        configureCellClosure(items[indexPath.row], cell)
        return cell
    }

    func item(at indexpath: IndexPath) -> ItemsType {

        return items[indexpath.row]
    }

}
