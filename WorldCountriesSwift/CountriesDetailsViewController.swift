//
//  CountriesDetailsViewController.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 29/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountriesDetailsViewController: UIViewController {

    // Use shared store
    var countryDataStore = CountriesStore()
    @IBOutlet private weak var countryDetailsTableView: UITableView!
    var dataSource: CountryDataSource<GenericCellData, CountryDetailTableViewCell>?
    @IBOutlet private weak var flagImageView: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var countryDetailTableView: UITableView!
    @IBOutlet private weak var loaderView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Public properties

    var selectedCountryName: String!
    var selectedCountryCode: String!
    var reuseIdentifier = CountryDetailTableViewCell.defaultReuseIdentifier
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Initial load

    func loadData() {

        // Fetch the image corresponding to the country code from the assets folder.
        flagImageView.image = UIImage(named: selectedCountryCode)
        name.text = selectedCountryName

        countryDataStore.fetchDetailsOfCountryWith(code: selectedCountryCode) {[weak self] (dataArray, error) in
            print(dataArray)
            DispatchQueue.main.async {
                print("Hello")
                self?.dataSource = CountryDataSource<GenericCellData, CountryDetailTableViewCell>(withData: dataArray, andId:CountryDetailTableViewCell.defaultReuseIdentifier, withConfigBlock: { (country, cell) in
                    cell.configureCell(with: country)
                })
                self?.countryDetailTableView.dataSource = self?.dataSource
                self?.countryDetailTableView.reloadData()
            }

        }
        countryDetailTableView.rowHeight = UITableView.automaticDimension
        countryDetailTableView.estimatedRowHeight = 80.0
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
