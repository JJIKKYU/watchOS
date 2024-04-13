// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    // import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "ComposableArchitecture": .framework,
            "Swinject": .staticFramework,
            "SDWebImageLottieCoder": .staticFramework,
            "SDWebImageSwiftUI": .staticFramework
        ]
    )

#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.9.2"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageLottieCoder.git", from: "0.2.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0"),
    ]
)
