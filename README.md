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
 
 ## Contributing

 If you want to build and test the code yourself, you can check out this repository and open is directly in Xcode. From there, you can edit the source code and run the tests.

 In order to run the built-in demo app, make sure you **don't** have the SwiftYNAB package open in Xcode, then open the demo app in Xcode from the `demo` directory. You should be able to run it in your simulator and take it for a spin.

 ### Recommended

In order to run the linters, or generate documentation, and to take advantage of the pre-commit hooks, you should:

1. Install [`mise`](https://mise.jdx.dev/getting-started.html)
2. Once `mise` is installed successfully, run `mise install` to install all of the project dependencies
3. Run `mise run bootstrap` to setup the project for development
3. Run `mise run` to see the available, pre-configured tasks