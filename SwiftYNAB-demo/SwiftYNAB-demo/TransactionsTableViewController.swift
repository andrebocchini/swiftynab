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
            if let budget = budget,
               let currencyFormat = budget.currencyFormat,
               let dateFormat = budget.dateFormat {
                currencyFormatter = CurrencyFormatter(currencyFormat: currencyFormat)
                dateFormatter = DateConverter(dateFormat: dateFormat)
            } else {
                currencyFormatter = nil
                dateFormatter = nil
            }
        }
    }

    private var currencyFormatter: CurrencyFormatter?
    private var dateFormatter: DateConverter?
    private var transactions: [TransactionDetail]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        fetchTransactions()
    }

    private func fetchTransactions() {
        guard let account = account,
              let budget = budget,
              let api = api
        else {
            transactions = []
            return
        }

        Task {
            do {
                self.transactions = try await api.transactions.getTransactions(
                    budgetId: budget.id,
                    accountId: account.id
                )
            } catch {
                self.transactions = []
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        transactions?.count ?? 0
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "transactionCell",
            for: indexPath
        ) as? TransactionTableViewCell else {
            fatalError()
        }

        if let transactions = transactions,
           let currencyFormatter = currencyFormatter,
           let dateFormatter = dateFormatter
        {
            cell.configure(
                with: transactions[indexPath.row],
                currencyFormatter: currencyFormatter,
                dateFormatter: dateFormatter
            )
        }

        return cell
    }
}
