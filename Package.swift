// swift-tools-version:5.2
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
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/givip/Telegrammer.git", .branch("master"))
    ],
    targets: [
        .target(name: "TelegrammerMiddleware", dependencies: [
            .product(name: "Telegrammer", package: "Telegrammer"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .target(name: "DemoTelegrammerMiddleware", dependencies: ["TelegrammerMiddleware"]),
        .testTarget(
            name: "TelegrammerMiddlewareTests",
            dependencies: ["TelegrammerMiddleware"]),
    ]
)
