[![Build Status](https://travis-ci.com/andrebocchini/swiftynab.svg?branch=master)](https://travis-ci.com/andrebocchini/swiftynab)  [![codecov](https://codecov.io/gh/andrebocchini/swiftynab/branch/master/graph/badge.svg)](https://codecov.io/gh/andrebocchini/swiftynab)



# SwiftYNAB

SwiftYNAB is a Swift framework for iOS/macOS/WatchOS/tvOS for accessing the [You Need a Budget](https://www.youneedabudget.com) [API](https://api.youneedabudget.com).  It currently supports all [endpoints](https://api.youneedabudget.com/v1) made available by the API.

You can browse the online documentation [here](https://andrebocchini.github.io/swiftynab) to see what features this framework offers.

## How to use it

### CocoaPods

1. Create a new project in Xcode
2. Add a `Podfile` to the root directory of your project with the following contents:

```
use_frameworks!
  
target :'Test' do
        pod 'SwiftYNAB', :git => 'https://github.com/andrebocchini/swiftynab.git'
end
```
3. Run `pod install`

### Swift Package Manager

You can also use the [Swift Package Manager](https://swift.org/package-manager/).  It's especially easy with Xcode 11 where adding a package dependency is as simple as choosing *File > Swift Packages > Add Package Dependency*.

### Trying it out

##### Personal API access token

The project comes with a small iOS demo that shows you how to use the framework.  If you want to try that out, or if you want to write your own code, you will need a personal API access token.

Make sure you go here and get one:

https://api.youneedabudget.com/#personal-access-tokens

##### Sample code

Once you have your personal access token, you can use it to try out the framework. Start by creating a new project and at the top of the file where you plan to use SwiftYNAB, add:

```swift
import SwiftYNAB
```

Then, you can try it out by writing something like:

```swift
let ynab = YNAB(accessToken: "TOKEN_GOES_HERE")
ynab.budgets.getBudgets() {
    (budgets, error) in
            
    if let budgets = budgets {
        for budget in budgets {
            print(budget.name)
        }
    } else {
        print("Uh oh, something went wrong")
    }
}
```
