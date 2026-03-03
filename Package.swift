// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NeumorphismUI",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "NeumorphismUI",
            targets: ["NeumorphismUI"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NeumorphismUI",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "NeumorphismUITests",
            dependencies: ["NeumorphismUI"],
            path: "Tests"
        ),
    ]
)
