//
//  BudgetsTableViewController.swift
//  SwiftYNAB-demo
//
//  Created by Andre Bocchini on 5/4/19.
//  Copyright © 2019 Andre Bocchini. All rights reserved.
//

import SwiftYNAB
import UIKit

class BudgetsTableViewController: UITableViewController {
    var api: YNAB?

    private var budgets: [BudgetSummary]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        fetchBudgets()
    }

    private func fetchBudgets() {
        guard let api = api else {
            budgets = []
            return
        }

        Task { [weak self] in
            guard let self = self else {
                budgets = []
                return
            }

            do {
                let budgets = try await api.budgets.getBudgets()
                self.budgets = budgets
            } catch {
                budgets = []
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
        budgets?.count ?? 0
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetCell", for: indexPath)

        if let label = cell.viewWithTag(1) as? UILabel,
           let budgets = budgets
        {
            label.text = budgets[indexPath.row].name
        }

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "showAccounts" {
            if let destination = segue.destination as? AccountsTableViewController {
                destination.api = api

                if let selectedRow = tableView.indexPathForSelectedRow?.row,
                   let budgets = budgets
                {
                    destination.budget = budgets[selectedRow]
                }
            }
        }
    }
}
