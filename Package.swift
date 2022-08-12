// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "CompileMemUsageReproducer",
    products: [
        .library(
            name: "CompileMemUsageReproducer",
            targets: [
                "LargeIntArray",
                
            ]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LargeIntArray",
            dependencies: []),
        .target(
            name: "LargeExistentialArray",
            dependencies: []),
        .target(
            name: "LargeObjectArray",
            dependencies: []),
    ]
)
