// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NeumorphismUI",
    platforms: [.iOS(.v13), .macOS(.v12)],
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
