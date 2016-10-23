//
//  CountryTableViewCell.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 22/10/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet private var flagImageView: UIImageView!
    @IBOutlet private var countryNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(with country: SimpleCountry) {

        self.flagImageView.image = UIImage(named: country.countryCode.lowercased())
        self.countryNameLabel.text = country.countryName
    }

}
