//
//  CountriesViewController.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 16/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {

    var countryDataStore = CountriesStore()
    @IBOutlet private var countryTableView: UITableView!
    var dataSource: CountryDataSource<SimpleCountry, CountryTableViewCell>?
    override func viewDidLoad() {
        super.viewDidLoad()

         dataSource = CountryDataSource<SimpleCountry, CountryTableViewCell>(withData: countryDataStore.countryData(), andId: CountryTableViewCell.defaultReuseIdentifier) { (country, cell) in
            cell.configureCell(with: country)
        }
        countryTableView.dataSource = dataSource
        countryTableView.rowHeight = UITableViewAutomaticDimension
        countryTableView.estimatedRowHeight = 80.0

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countryTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
