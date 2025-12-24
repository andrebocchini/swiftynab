// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "SwiftYNAB",
    platforms: [
        .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
    ],
    products: [
        .library(name: "SwiftYNAB", targets: ["SwiftYNAB"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftYNAB",
            dependencies: [],
            exclude: ["../../demo"]
        ),
        .testTarget(
            name: "SwiftYNABTests",
            dependencies: ["SwiftYNAB"]
        )
    ],
    swiftLanguageModes: [.v6]
)
