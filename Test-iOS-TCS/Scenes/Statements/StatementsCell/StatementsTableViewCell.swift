//
//  StatementsTableViewCell.swift
//  Test-iOS-TCS
//
//  Created by Ewerton Rabello on 05/05/20.
//  Copyright © 2020 Ewerton Rabello. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillInCell(statement: StatementList) {
        self.titleLabel.text = statement.title
        self.descriptionLabel.text = statement.accountName
        self.dateLabel.text = statement.date?.convertDataFormat() ?? ""
        self.valueLabel.text = statement.accountValue?.currencyFormatted() ?? "R$ 0,00"
    }
}
