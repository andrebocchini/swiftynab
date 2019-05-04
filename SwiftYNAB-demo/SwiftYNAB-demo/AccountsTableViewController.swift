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

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        fetchAccounts()
    }
    
    private func fetchAccounts() {
        guard let budget = self.budget else {
            return
        }
        
        self.api?.accounts.getAccounts(budgetId: budget.id, completion: {
            (accounts: [Account]?, error: ErrorDetail?) in
            
            if let accounts = accounts {
                self.accounts = accounts.filter {
                    return !$0.closed
                }
            } else {
                self.accounts = [Account]()
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
        return self.accounts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath)

        if let label = cell.viewWithTag(1) as? UILabel,
            let accounts = self.accounts {
            
            label.text = accounts[indexPath.row].name
        }
        
        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTransactions" {
            if let destination = segue.destination as? TransactionsTableViewController {
                destination.api = self.api
                
                if let selectedRow = self.tableView.indexPathForSelectedRow?.row,
                    let accounts = self.accounts,
                    let budget = self.budget {
                    destination.account = accounts[selectedRow]
                    destination.budget = budget
                }
            }
        }
    }

}
