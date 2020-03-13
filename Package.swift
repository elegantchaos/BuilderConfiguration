// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "BuilderConfiguration",
    products: [
        .library(
            name: "BuilderConfiguration",
            targets: ["BuilderConfiguration"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elegantchaos/Builder.git", from: "1.1.1"),
    ],
    targets: [
        .target(
            name: "BuilderConfiguration",
            dependencies: []),
        .testTarget(
            name: "BuilderConfigurationTests",
            dependencies: ["BuilderConfiguration"]),
    ]
)
