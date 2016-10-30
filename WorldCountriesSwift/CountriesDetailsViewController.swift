//
//  CountriesDetailsViewController.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 29/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountriesDetailsViewController: UIViewController {

    @IBOutlet private weak var flagImageView: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var countryDetailTableView: UITableView!
    @IBOutlet private weak var loaderView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Public properties

    var selectedCountryName: String!
    var selectedCountryCode: String!

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
