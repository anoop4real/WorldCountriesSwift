//
//  CountryDetailTableViewCell.swift
//  WorldCountriesSwift
//
//  Created by anoopm on 01/11/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class CountryDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(with country: GenericCellData) {

        self.titleLabel.text  = country.title
        self.detailLabel.text = country.detail
    }

}
