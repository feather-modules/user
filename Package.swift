// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "user-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "UserModule", targets: ["UserModule"]),
        .library(name: "UserModuleApi", targets: ["UserModuleApi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.2.0-beta"),
        
        /// feather core
        .package(url: "https://github.com/FeatherCMS/feather-core", from: "1.0.0-beta"),
        /// core modules
        .package(url: "https://github.com/FeatherCMS/system-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/api-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/admin-module", from: "1.0.0-beta"),
        .package(url: "https://github.com/FeatherCMS/frontend-module", from: "1.0.0-beta"),
    ],
    targets: [
        .target(name: "UserModuleApi", dependencies: []),
        .target(name: "UserModule", dependencies: [
            .target(name: "UserModuleApi"),
            
            .product(name: "FeatherCore", package: "feather-core"),
        ],
        resources: [
            .copy("Bundle"),
        ]),
        .target(name: "Feather", dependencies: [
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            
            /// feather
            .product(name: "FeatherCore", package: "feather-core"),
            /// core modules
            .product(name: "SystemModule", package: "system-module"),
            .product(name: "ApiModule", package: "api-module"),
            .product(name: "AdminModule", package: "admin-module"),
            .product(name: "FrontendModule", package: "frontend-module"),
            
            .target(name: "UserModule"),
        ]),
        .testTarget(name: "UserModuleTests", dependencies: [
            .target(name: "UserModule"),
        ])
    ]
)
