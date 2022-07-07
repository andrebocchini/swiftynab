//
//  TransactionTableViewCell.swift
//  SwiftYNAB-demo
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import SwiftYNAB
import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var payeeLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!

    func configure(
        with transaction: TransactionDetail,
        currencyFormatter: CurrencyFormatter,
        dateFormatter: DateConverter
    ) {
        dateLabel.text = dateFormatter.budgetFormatDateString(from: transaction.date)
        payeeLabel.text = transaction.payeeName
        amountLabel.text = currencyFormatter.currencyString(from: transaction.amount)
    }
}
