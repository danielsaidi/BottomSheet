// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "BottomSheet",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "BottomSheet",
            targets: ["BottomSheet"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BottomSheet",
            dependencies: [],
            exclude: ["Bundle/Bundle+Module.swift"],
            resources: [.process("Resources")]),
        .testTarget(
            name: "BottomSheetTests",
            dependencies: ["BottomSheet"])
    ]
)
