// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorNativeSafearea",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorNativeSafearea",
            targets: ["CapSafeAreaPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "CapSafeAreaPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CapSafeAreaPlugin"),
        .testTarget(
            name: "CapSafeAreaPluginTests",
            dependencies: ["CapSafeAreaPlugin"],
            path: "ios/Tests/CapSafeAreaPluginTests")
    ]
)