// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwanUI",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwanUI",
            targets: ["SwanUI"]),
        .library(name: "VaporAdapter", targets: ["VaporAdapter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.106.1"),
        .package(url: "https://github.com/sliemeobn/elementary.git", from: "0.4.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwanUI",
            dependencies: [
                .product(name: "Elementary", package: "elementary")
            ]),
        .target(
            name: "VaporAdapter",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "SwanUI",
            ]),
        .testTarget(
            name: "SwanUITests",
            dependencies: ["SwanUI"]
        ),
    ]
)
