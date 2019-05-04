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

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var payeeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!

    func configure(with transaction: TransactionDetail,
                   currencyFormatter: CurrencyFormatter,
                   dateFormatter: DateConverter) {
        self.dateLabel.text = dateFormatter.budgetFormatDateString(from: transaction.date)
        self.payeeLabel.text = transaction.payeeName
        self.amountLabel.text = currencyFormatter.currencyString(from: transaction.amount)
    }
    
}
