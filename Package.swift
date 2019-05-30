// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftYNAB",
    platforms: [
   		.macOS(.v10_14), .iOS(.v11), .tvOS(.v12), .watchOS(.v5)
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
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
