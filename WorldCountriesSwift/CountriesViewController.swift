//
//  CountriesViewController.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 16/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController, SegueHandlerType {

    var countryDataStore = CountriesStore()
    @IBOutlet private weak var countryTableView: UITableView!
    var dataSource: CountryDataSource<SimpleCountry, CountryTableViewCell>?

    enum SegueIdentifier: String {
        case ShowDetails
    }
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



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        switch segueIdentifierForSegue(segue: segue) {
        case .ShowDetails:
            print("ShowDetails")
            guard let indexPath = countryTableView.indexPathForSelectedRow else {

                fatalError("Couldnt find the clicked index path")
            }
            guard let selectedCountry = dataSource?.item(at: indexPath) else {
                fatalError("Couldnt find the country")
            }
            // So indexpath exists
            let countryDetailsVC = segue.destination as! CountriesDetailsViewController

            countryDetailsVC.selectedCountryCode = selectedCountry.countryCode
            countryDetailsVC.selectedCountryName = selectedCountry.countryName
            countryTableView.deselectRow(at: indexPath, animated: true)
        }
    }


}
