// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SANZONE-sdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SANZONE-sdk",
            targets: ["SANZONE-sdk"]),
    ],
    targets: [
        .target(
            name: "SANZONE-sdk",
            path: "Sources/"
        ),
        .testTarget(
            name: "SANZONE-sdk-iosTests",
            dependencies: ["SANZONE-sdk"]),
    ]
)



