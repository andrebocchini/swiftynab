# SwiftYNAB

![Build Status](https://github.com/andrebocchini/swiftynab/actions/workflows/build.yml/badge.svg?branch=master)

SwiftYNAB is a Swift framework for iOS/macOS/WatchOS/tvOS for accessing the [You Need a Budget](https://www.youneedabudget.com) [API](https://api.youneedabudget.com).  It currently supports all [endpoints](https://api.youneedabudget.com/v1) made available by the API.

You can browse the online documentation [here](https://andrebocchini.github.io/swiftynab) to see what features this framework offers.

## How to use it

### Swift Package Manager

Instructions on how to add a Swift Package dependency to your project can be found [here](https://developer.apple.com/documentation/xcode/swift-packages).

### Trying it out

#### Personal API access token

The project comes with a small iOS demo that shows you how to use the framework.  If you want to try that out, or if you want to write your own code, you will need a personal API access token.

Make sure you go here and get one:

[https://api.youneedabudget.com/#personal-access-tokens](https://api.youneedabudget.com/#personal-access-tokens)

##### Sample code

Once you have your personal access token, you can use it to try out the framework in your app. Start by creating a new project and at the top of the file where you plan to use SwiftYNAB, add:

```swift
import SwiftYNAB
```

Then, you can try it out by writing something like:

```swift
let ynab = YNAB(accessToken: "TOKEN_GOES_HERE")

Task {
    do {
        let budgets = try await ynab.budgets.budgets(includeAccounts: false)

        for budget in budgets {
            print(budget.name)
        }
    } catch {
        print("Uh oh, something went wrong")
    }
}
```
 