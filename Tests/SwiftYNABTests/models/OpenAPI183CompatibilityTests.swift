import Foundation
import Testing
@testable import SwiftYNAB

@Suite("OpenAPI 1.83 Compatibility")
struct OpenAPI183CompatibilityTests {
    @Test("Account decodes new formatted currency fields and preserves read-side account types")
    func accountDecoding() throws {
        let account = try decode(Account.self, from: """
        {
          "id": "account-id",
          "name": "Mortgage",
          "type": "mortgage",
          "on_budget": false,
          "closed": false,
          "balance": -1200000,
          "balance_formatted": "-$1,200.00",
          "balance_currency": -1200.0,
          "cleared_balance": -1200000,
          "cleared_balance_formatted": "-$1,200.00",
          "cleared_balance_currency": -1200.0,
          "uncleared_balance": 0,
          "uncleared_balance_formatted": "$0.00",
          "uncleared_balance_currency": 0.0,
          "direct_import_linked": false,
          "direct_import_in_error": false,
          "deleted": false
        }
        """)

        #expect(account.type == .mortgage)
        #expect(account.balanceFormatted == "-$1,200.00")
        #expect(account.balanceCurrency == Decimal(string: "-1200.0"))
        #expect(account.clearedBalanceFormatted == "-$1,200.00")
        #expect(account.unclearedBalanceCurrency == Decimal(string: "0.0"))
    }

    @Test("Account decodes when direct import fields are omitted")
    func accountDecodingWithOmittedDirectImportFields() throws {
        let account = try decode(Account.self, from: """
        {
          "id": "account-id",
          "name": "Checking",
          "type": "checking",
          "on_budget": true,
          "closed": false,
          "balance": 120000,
          "cleared_balance": 120000,
          "uncleared_balance": 0,
          "deleted": false
        }
        """)

        #expect(account.id == "account-id")
        #expect(account.name == "Checking")
        #expect(try decodedNil(named: "directImportLinked", in: account))
        #expect(try decodedNil(named: "directImportInError", in: account))
    }

    @Test("Category decodes new formatted and decimal goal fields")
    func categoryDecoding() throws {
        let category = try decode(Category.self, from: """
        {
          "id": "category-id",
          "category_group_id": "group-id",
          "name": "Groceries",
          "hidden": false,
          "budgeted": 10000,
          "budgeted_formatted": "$10.00",
          "budgeted_currency": 10.0,
          "activity": -2500,
          "activity_formatted": "-$2.50",
          "activity_currency": -2.5,
          "balance": 7500,
          "balance_formatted": "$7.50",
          "balance_currency": 7.5,
          "goal_type": "NEED",
          "goal_needs_whole_amount": true,
          "goal_target": 10000,
          "goal_target_formatted": "$10.00",
          "goal_target_currency": 10.0,
          "goal_under_funded": 2500,
          "goal_under_funded_formatted": "$2.50",
          "goal_under_funded_currency": 2.5,
          "goal_overall_funded": 5000,
          "goal_overall_funded_formatted": "$5.00",
          "goal_overall_funded_currency": 5.0,
          "goal_overall_left": 5000,
          "goal_overall_left_formatted": "$5.00",
          "goal_overall_left_currency": 5.0,
          "deleted": false
        }
        """)

        #expect(category.balanceFormatted == "$7.50")
        #expect(category.activityCurrency == Decimal(string: "-2.5"))
        #expect(category.budgetedFormatted == "$10.00")
        #expect(category.goalNeedsWholeAmount == true)
        #expect(category.goalTargetCurrency == Decimal(string: "10.0"))
        #expect(category.goalUnderFundedFormatted == "$2.50")
        #expect(category.goalOverallFundedCurrency == Decimal(string: "5.0"))
        #expect(category.goalOverallLeftFormatted == "$5.00")
    }

    @Test("TransactionSummary decodes flag_name")
    func transactionSummaryDecodesFlagName() throws {
        let transaction = try decode(TransactionSummary.self, from: """
        {
          "id": "transaction-id",
          "date": "2026-04-01",
          "amount": -1050,
          "cleared": "cleared",
          "approved": true,
          "flag_name": "Purple",
          "account_id": "account-id",
          "deleted": false
        }
        """)

        #expect(try decodedString(named: "flagName", in: transaction) == "Purple")
    }

    @Test("Transaction models decode formatted and decimal amounts")
    func transactionDecoding() throws {
        let transaction = try decode(TransactionSummary.self, from: """
        {
          "id": "transaction-id",
          "date": "2026-04-01",
          "amount": -1050,
          "amount_formatted": "-$1.05",
          "amount_currency": -1.05,
          "cleared": "cleared",
          "approved": true,
          "account_id": "account-id",
          "deleted": false
        }
        """)
        let subtransaction = try decode(SubTransaction.self, from: """
        {
          "id": "subtransaction-id",
          "transaction_id": "transaction-id",
          "amount": -500,
          "amount_formatted": "-$0.50",
          "amount_currency": -0.5,
          "deleted": false
        }
        """)

        #expect(transaction.amountFormatted == "-$1.05")
        #expect(transaction.amountCurrency == Decimal(string: "-1.05"))
        #expect(subtransaction.amountFormatted == "-$0.50")
        #expect(subtransaction.amountCurrency == Decimal(string: "-0.5"))
    }

    @Test("ScheduledTransactionSummary decodes flag_name")
    func scheduledTransactionSummaryDecodesFlagName() throws {
        let summary = try decode(ScheduledTransactionSummary.self, from: """
        {
          "id": "scheduled-id",
          "date_first": "2026-04-01",
          "date_next": "2026-05-01",
          "frequency": "monthly",
          "amount": -1000,
          "flag_name": "Blue",
          "account_id": "account-id",
          "payee_id": null,
          "deleted": false
        }
        """)

        #expect(try decodedString(named: "flagName", in: summary) == "Blue")
    }

    @Test("ScheduledTransactionDetail decodes flag_name")
    func scheduledTransactionDetailDecodesFlagName() throws {
        let detail = try decode(ScheduledTransactionDetail.self, from: """
        {
          "id": "scheduled-id",
          "date_first": "2026-04-01",
          "date_next": "2026-05-01",
          "frequency": "monthly",
          "amount": -1000,
          "flag_name": "Green",
          "account_id": "account-id",
          "account_name": "Checking",
          "payee_id": null,
          "payee_name": null,
          "deleted": false,
          "subtransactions": []
        }
        """)

        #expect(try decodedString(named: "flagName", in: detail) == "Green")
    }

    @Test("ScheduledSubTransaction decodes payee_name")
    func scheduledSubTransactionDecodesPayeeName() throws {
        let subtransaction = try decode(ScheduledSubTransaction.self, from: """
        {
          "id": "scheduled-sub-id",
          "scheduled_transaction_id": "scheduled-id",
          "amount": -250,
          "payee_name": "Coffee Shop",
          "deleted": false
        }
        """)

        #expect(try decodedString(named: "payeeName", in: subtransaction) == "Coffee Shop")
    }

    @Test("ScheduledSubTransaction decodes category_name")
    func scheduledSubTransactionDecodesCategoryName() throws {
        let subtransaction = try decode(ScheduledSubTransaction.self, from: """
        {
          "id": "scheduled-sub-id",
          "scheduled_transaction_id": "scheduled-id",
          "amount": -250,
          "category_name": "Coffee",
          "deleted": false
        }
        """)

        #expect(try decodedString(named: "categoryName", in: subtransaction) == "Coffee")
    }

    @Test("Scheduled transaction models decode formatted amounts and nullable payee fields")
    func scheduledTransactionDecoding() throws {
        let summary = try decode(ScheduledTransactionSummary.self, from: """
        {
          "id": "scheduled-id",
          "date_first": "2026-04-01",
          "date_next": "2026-05-01",
          "frequency": "monthly",
          "amount": -1000,
          "amount_formatted": "-$1.00",
          "amount_currency": -1.0,
          "account_id": "account-id",
          "payee_id": null,
          "deleted": false
        }
        """)
        let detail = try decode(ScheduledTransactionDetail.self, from: """
        {
          "id": "scheduled-id",
          "date_first": "2026-04-01",
          "date_next": "2026-05-01",
          "frequency": "monthly",
          "amount": -1000,
          "amount_formatted": "-$1.00",
          "amount_currency": -1.0,
          "account_id": "account-id",
          "account_name": "Checking",
          "payee_id": null,
          "payee_name": null,
          "deleted": false,
          "subtransactions": []
        }
        """)
        let subtransaction = try decode(ScheduledSubTransaction.self, from: """
        {
          "id": "scheduled-sub-id",
          "scheduled_transaction_id": "scheduled-id",
          "amount": -250,
          "amount_formatted": "-$0.25",
          "amount_currency": -0.25,
          "deleted": false
        }
        """)

        #expect(summary.payeeId == nil)
        #expect(summary.amountFormatted == "-$1.00")
        #expect(detail.payeeId == nil)
        #expect(detail.payeeName == nil)
        #expect(detail.amountCurrency == Decimal(string: "-1.0"))
        #expect(subtransaction.amountFormatted == "-$0.25")
        #expect(subtransaction.amountCurrency == Decimal(string: "-0.25"))
    }

    @Test("Month and money movement models decode formatted currency fields")
    func monthAndMoneyMovementDecoding() throws {
        let month = try decode(MonthSummary.self, from: """
        {
          "month": "2026-04-01",
          "income": 500000,
          "income_formatted": "$500.00",
          "income_currency": 500.0,
          "budgeted": 350000,
          "budgeted_formatted": "$350.00",
          "budgeted_currency": 350.0,
          "activity": -125000,
          "activity_formatted": "-$125.00",
          "activity_currency": -125.0,
          "to_be_budgeted": 25000,
          "to_be_budgeted_formatted": "$25.00",
          "to_be_budgeted_currency": 25.0,
          "deleted": false
        }
        """)
        let moneyMovement = try decode(MoneyMovement.self, from: """
        {
          "id": "movement-id",
          "amount": 1500,
          "amount_formatted": "$1.50",
          "amount_currency": 1.5
        }
        """)

        #expect(month.incomeFormatted == "$500.00")
        #expect(month.budgetedCurrency == Decimal(string: "350.0"))
        #expect(month.activityFormatted == "-$125.00")
        #expect(month.toBeBudgetedCurrency == Decimal(string: "25.0"))
        #expect(moneyMovement.amountFormatted == "$1.50")
        #expect(moneyMovement.amountCurrency == Decimal(string: "1.5"))
    }

    @Test("PlanDetail decodes base-schema nested payloads without formatted currency fields")
    func planDetailBaseShapeDecoding() throws {
        let plan = try decode(PlanDetail.self, from: planDetailBaseSchemaJSON)

        let account = try #require(plan.accounts.first)
        let category = try #require(plan.categories.first)
        let month = try #require(plan.months.first)
        let transaction = try #require(plan.transactions.first)
        let subtransaction = try #require(plan.subtransactions.first)
        let scheduledTransaction = try #require(plan.scheduledTransactions.first)
        let scheduledSubtransaction = try #require(plan.scheduledSubtransactions.first)

        #expect(account.balanceFormatted == nil)
        #expect(category.balanceFormatted == nil)
        #expect(month.incomeFormatted == nil)
        #expect(transaction.amountFormatted == nil)
        #expect(subtransaction.amountFormatted == nil)
        #expect(scheduledTransaction.amountFormatted == nil)
        #expect(scheduledTransaction.payeeId == nil)
        #expect(scheduledSubtransaction.amountFormatted == nil)
    }
}

private let planDetailBaseSchemaJSON = """
{
  "id": "plan-id",
  "name": "Sample Plan",
  "last_modified_on": "2026-04-01T00:00:00Z",
  "first_month": "2026-04-01",
  "last_month": "2026-12-01",
  "accounts": [
    {
      "id": "account-id",
      "name": "Checking",
      "type": "checking",
      "on_budget": true,
      "closed": false,
      "balance": 123400,
      "cleared_balance": 123400,
      "uncleared_balance": 0,
      "direct_import_linked": false,
      "direct_import_in_error": false,
      "deleted": false
    }
  ],
  "payees": [],
  "payee_locations": [],
  "category_groups": [
    {
      "id": "group-id",
      "name": "Everyday",
      "hidden": false,
      "deleted": false
    }
  ],
  "categories": [
    {
      "id": "category-id",
      "category_group_id": "group-id",
      "name": "Groceries",
      "hidden": false,
      "budgeted": 10000,
      "activity": -2500,
      "balance": 7500,
      "deleted": false
    }
  ],
  "months": [
    {
      "month": "2026-04-01",
      "income": 500000,
      "budgeted": 350000,
      "activity": -125000,
      "to_be_budgeted": 25000,
      "deleted": false,
      "categories": [
        {
          "id": "month-category-id",
          "category_group_id": "group-id",
          "name": "Groceries",
          "hidden": false,
          "budgeted": 10000,
          "activity": -2500,
          "balance": 7500,
          "deleted": false
        }
      ]
    }
  ],
  "transactions": [
    {
      "id": "transaction-id",
      "date": "2026-04-01",
      "amount": -1000,
      "cleared": "cleared",
      "approved": true,
      "account_id": "account-id",
      "deleted": false
    }
  ],
  "subtransactions": [
    {
      "id": "subtransaction-id",
      "transaction_id": "transaction-id",
      "amount": -500,
      "deleted": false
    }
  ],
  "scheduled_transactions": [
    {
      "id": "scheduled-id",
      "date_first": "2026-04-01",
      "date_next": "2026-05-01",
      "frequency": "monthly",
      "amount": -1000,
      "account_id": "account-id",
      "payee_id": null,
      "deleted": false
    }
  ],
  "scheduled_subtransactions": [
    {
      "id": "scheduled-sub-id",
      "scheduled_transaction_id": "scheduled-id",
      "amount": -250,
      "deleted": false
    }
  ]
}
"""

private func decode<T: Decodable>(_ type: T.Type, from json: String) throws -> T {
    let serializer = Serializer()
    let data = try #require(json.data(using: .utf8))
    return try serializer.decode(type, from: data)
}

private func decodedString(named name: String, in model: some Any) throws -> String {
    let child = try #require(
        Mirror(reflecting: model).children.first { $0.label == name },
        "Expected decoded field named \(name)"
    )

    if let value = child.value as? String {
        return value
    }

    let optionalMirror = Mirror(reflecting: child.value)
    let wrappedValue = try #require(
        optionalMirror.children.first?.value,
        "Expected decoded field \(name) to contain a string"
    )

    return try #require(wrappedValue as? String)
}

private func decodedNil(named name: String, in model: some Any) throws -> Bool {
    let child = try #require(
        Mirror(reflecting: model).children.first { $0.label == name },
        "Expected decoded field named \(name)"
    )

    let mirror = Mirror(reflecting: child.value)
    return mirror.displayStyle == .optional && mirror.children.isEmpty
}
