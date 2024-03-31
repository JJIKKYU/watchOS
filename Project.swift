import ProjectDescription

let project = Project(
    name: "WatchOSTest",
    packages: [],
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
