// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SwiftYNAB",
    platforms: [
   		.macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
	],
    products: [
    	.library(name: "SwiftYNAB", targets: ["SwiftYNAB"]),
    ],
    dependencies: [],
    targets: [
        .target(
        	name: "SwiftYNAB",
        	dependencies: [],
        	path: "SwiftYNAB/SwiftYNAB"
        ),
        .testTarget(
            name: "SwiftYNABTests",
            dependencies: ["SwiftYNAB"]),
            path: "SwiftYNAB/SwiftYNABTests"
    ],
    swiftLanguageVersions: [.v5]
)
