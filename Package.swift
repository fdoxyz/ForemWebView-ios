// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ForemWebView",
    platforms: [.iOS(.v13), .macOS(.v10_12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ForemWebView",
            targets: ["ForemWebView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Yummypets/YPImagePicker", .branch("spm")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
        .package(url: "https://github.com/Alamofire/AlamofireImage.git", from: "4.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ForemWebView",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire", condition: .when(platforms: [.iOS])),
                .product(name: "AlamofireImage", package: "AlamofireImage", condition: .when(platforms: [.iOS])),
                .product(name: "YPImagePicker", package: "YPImagePicker", condition: .when(platforms: [.iOS])),
            ],
            resources: [.process("JS+CSS")]),
        .testTarget(
            name: "ForemWebViewTests",
            dependencies: ["ForemWebView"],
            resources: [.process("Assets")])
    ]
)
