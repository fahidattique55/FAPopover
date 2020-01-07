// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "FAPopover",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "FAPopover",
            targets: ["FAPopover"]),
    ],
    dependencies: [
        // no dependencies
    ],
    targets: [
        .target(name: "FAPopover", path: "FAPopover/Source")
    ]
)
    
