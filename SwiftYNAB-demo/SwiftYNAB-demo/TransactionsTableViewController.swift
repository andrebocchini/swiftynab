//
//  TransactionsTableViewController.swift
//  SwiftYNAB-demo
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import SwiftYNAB
import UIKit

class TransactionsTableViewController: UITableViewController {

    var api: YNAB?
    var account: Account?
    var budget: BudgetSummary? {
        didSet {
            if let budget = budget {
                self.currencyFormatter = CurrencyFormatter(currencyFormat: budget.currencyFormat)
                self.dateFormatter = DateConverter(dateFormat: budget.dateFormat)
            } else {
                self.currencyFormatter = nil
                self.dateFormatter = nil
            }
        }
    }

    private var currencyFormatter: CurrencyFormatter?
    private var dateFormatter: DateConverter?
    private var transactions: [TransactionDetail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        fetchTransactions()
    }
    
    private func fetchTransactions() {
        guard let account = self.account,
            let budget = self.budget else {
                return
        }
        
        self.api?.transactions.getTransactions(budgetId: budget.id, accountId: account.id, completion: { (transactions: [TransactionDetail]?, error: ErrorDetail?) in
            
            if let transactions = transactions {
                self.transactions = transactions.sorted {
                    return $0.date > $1.date
                }
            } else {
                self.transactions = [TransactionDetail]()
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as? TransactionTableViewCell else {
            fatalError()
        }

        if let transactions = self.transactions,
            let currencyFormatter = self.currencyFormatter,
            let dateFormatter = self.dateFormatter {
            
            cell.configure(with: transactions[indexPath.row],
                           currencyFormatter: currencyFormatter,
                           dateFormatter: dateFormatter)
        }
        
        return cell
    }
    
}
