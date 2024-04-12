import ProjectDescription

let project: Project = .init(
    name: "HiraganaService",
    packages: [
        .remote(url: "https://github.com/SDWebImage/SDWebImageLottieCoder.git", requirement: .range(from: "0.2.0", to: "0.2.0")),
        .remote(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", requirement: .exact("2.0.0")),
        .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.9.2"))
    ],
    targets: [
        .target(
            name: "HiraganaService",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .framework,
            bundleId: "com.jjikkyu.HiraganaService",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .package(product: "SDWebImageLottieCoder", type: .runtime, condition: .none),
                .package(product: "SDWebImageSwiftUI", type: .runtime, condition: .none),
                .package(product: "ComposableArchitecture", type: .runtime, condition: nil),
                .project(target: "Dependency", path: .relativeToRoot("Modules/Dependency"), condition: .none),
            ]
        )
    ]
)
