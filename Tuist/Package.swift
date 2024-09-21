// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
@preconcurrency import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [:]
    )
#endif

let package = Package(
    name: "ILoveTuist",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.2.2"),
        .package(url: "https://github.com/hmlongco/Factory", .upToNextMajor(from: "2.1.0")),
        .package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMajor(from: "4.1.2")),
    ]
)
