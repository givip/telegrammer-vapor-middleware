// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "telegrammer-vapor-middleware",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "DemoTelegrammerMiddleware", targets: ["DemoTelegrammerMiddleware"]),
        .library(name: "TelegrammerMiddleware", targets: ["TelegrammerMiddleware"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-beta"),
        .package(url: "https://github.com/givip/Telegrammer.git", from: "1.0.0-alpha")
    ],
    targets: [
        .target(name: "TelegrammerMiddleware", dependencies: [
            "Telegrammer",
            "Vapor"
        ]),
        .target(name: "DemoTelegrammerMiddleware", dependencies: ["TelegrammerMiddleware"]),
        .testTarget(
            name: "TelegrammerMiddlewareTests",
            dependencies: ["TelegrammerMiddleware"]),
    ]
)
