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
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44

        fetchBudgets()
    }
    
    private func fetchBudgets() {
        self.api?.budgets.getBudgets() {
            (budgets: [BudgetSummary]?, error: ErrorDetail?) in
            
            if let budgets = budgets {
                self.budgets = budgets
            } else {
                self.budgets = [BudgetSummary]()
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.budgets?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "budgetCell", for: indexPath)
    
        if let label = cell.viewWithTag(1) as? UILabel,
            let budgets = self.budgets {
            
            label.text = budgets[indexPath.row].name
        }

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAccounts" {
            if let destination = segue.destination as? AccountsTableViewController {
                destination.api = self.api
                
                if let selectedRow = self.tableView.indexPathForSelectedRow?.row,
                    let budgets = self.budgets {
                    destination.budget = budgets[selectedRow]
                }
            }
        }
    }

}
