// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "HL7",
    products: [
        .library(
            name: "HL7",
            targets: ["HL7"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HL7",
            dependencies: []
        ),
    ]
)
