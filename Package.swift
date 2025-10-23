// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SanzoneSDK",
    platforms: [
        .iOS(.v15),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "SanzoneSDK",
            targets: ["SanzoneSDK"]
        ),
    ],
    targets: [
        .target(
            name: "SanzoneSDK",
            path: "Sources/"
        ),
        .testTarget(
            name: "SANZONE-sdk-iosTests",
            dependencies: ["SanzoneSDK"]
        ),
    ]
)


