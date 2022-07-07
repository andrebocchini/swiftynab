//
//  AccountsTableViewController.swift
//  SwiftYNAB-demo
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import SwiftYNAB
import UIKit

class AccountsTableViewController: UITableViewController {
    var api: YNAB?
    var budget: BudgetSummary?

    private var accounts: [Account]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        fetchAccounts()
    }

    private func fetchAccounts() {
        guard let budget = budget,
              let api = api
        else {
            accounts = []
            return
        }

        Task { [weak self] in
            guard let self = self else {
                return
            }

            do {
                let accounts = try await api.accounts.getAccounts(budgetId: budget.id)
                self.accounts = accounts.filter {
                    !$0.closed
                }
            } catch {
                self.accounts = []
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
        accounts?.count ?? 0
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath)

        if let label = cell.viewWithTag(1) as? UILabel,
           let accounts = accounts
        {
            label.text = accounts[indexPath.row].name
        }

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "showTransactions" {
            if let destination = segue.destination as? TransactionsTableViewController {
                destination.api = api

                if let selectedRow = tableView.indexPathForSelectedRow?.row,
                   let accounts = accounts,
                   let budget = budget
                {
                    destination.account = accounts[selectedRow]
                    destination.budget = budget
                }
            }
        }
    }
}
