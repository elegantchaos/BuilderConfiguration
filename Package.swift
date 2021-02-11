// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "BuilderConfiguration",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "BuilderConfiguration",
            targets: ["BuilderConfiguration"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elegantchaos/Builder.git", from: "1.2.2"),
    ],
    targets: [
        .target(
            name: "BuilderConfiguration",
            dependencies: [.product(name: "builder", package: "Builder")]),
        .testTarget(
            name: "BuilderConfigurationTests",
            dependencies: ["BuilderConfiguration"]),
    ]
)
