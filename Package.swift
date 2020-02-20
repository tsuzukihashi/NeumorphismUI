import PackageDescription

let package = Package(
    name: "NeumorphismUI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "NeumorphismUI",
            targets: ["NeumorphismUI"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "NeumorphismUI",
            dependencies: [],
            path: "Sources")),
        .testTarget(
            name: "NeumorphismUITests",
            dependencies: ["NeumorphismUI"],
            path: "Tests"),
    ]
)
