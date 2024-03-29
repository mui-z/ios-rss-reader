// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RssReaderPackage",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RssReaderPackage",
            targets: ["RssReaderPackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
		.package(url: "https://github.com/crane-hiromu/CombineStorable.git", from: "1.1.0"),
		.package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
		.package(url: "https://github.com/nmdias/FeedKit.git", from: "9.1.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RssReaderPackage",
            dependencies: [
				"CombineStorable",
				"Alamofire",
				"FeedKit"
			]),
        .testTarget(
            name: "RssReaderPackageTests",
            dependencies: ["RssReaderPackage"]),
    ]
)
