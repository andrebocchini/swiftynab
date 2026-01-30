// swift-tools-version:6.0

import PackageDescription

#if os(Linux)
let platforms: [SupportedPlatform]? = nil
#else
let platforms: [SupportedPlatform]? = [
    .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
]
#endif

let package = Package(
    name: "SwiftYNAB",
    platforms: platforms,
    products: [
        .library(name: "SwiftYNAB", targets: ["SwiftYNAB"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftYNAB",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftYNABTests",
            dependencies: ["SwiftYNAB"]
        )
    ],
    swiftLanguageModes: [.v6]
)
