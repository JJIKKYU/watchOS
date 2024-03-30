import ProjectDescription

let project = Project(
    name: "WatchOSTest",
    packages: [
        .remote(url: "https://github.com/SDWebImage/SDWebImageLottieCoder.git", requirement: .range(from: "0.2.0", to: "0.2.0")),
        .remote(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", requirement: .exact("2.0.0")),
    ],
    targets: [
        .target(
            name: "WatchOSTest",
            destinations: .watchOS,
            product: .app,
            bundleId: "com.jjikkyu.WatchOSTest",
            infoPlist: .extendingDefault(
                with: [
                     "WKApplication": .boolean(true),
                     "WKCompanionAppBundleIdentifier": "com.jjikkyu"
                ]
            ),
            sources: ["WatchOSTest/Sources/**"],
            resources: ["WatchOSTest/Resources/**"],
            dependencies: [
                .package(product: "SDWebImageLottieCoder", type: .runtime, condition: .none),
                .package(product: "SDWebImageSwiftUI", type: .runtime, condition: .none),
//                .project(target: "Entity", path: .relativeToRoot("Modules/Entity"), condition: .none),
//                .project(target: "Repository", path: .relativeToRoot("Modules/Repository"), condition: .none),
//                .project(target: "Dependency", path: .relativeToRoot("Modules/Dependency"), condition: .none),
                .project(target: "HiraganaService", path: .relativeToRoot("Modules/HiraganaService"), condition: .none),
            ]
        ),
        .target(
            name: "WatchOSTestTests",
            destinations: .watchOS,
            product: .unitTests,
            bundleId: "com.jjikkyu.WatchOSTestTests",
            infoPlist: .default,
            sources: ["WatchOSTest/Tests/**"],
            resources: [],
            dependencies: [.target(name: "WatchOSTest")]
        ),
    ]
)
