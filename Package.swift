import PackageDescription

let package = Package(
    name: "NeumorphismUI",
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
            dependencies: []),
        .testTarget(
            name: "NeumorphismUITests",
            dependencies: ["NeumorphismUI"]),
    ]
)
