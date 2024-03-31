import ProjectDescription

let project = Project(
    name: "Harugana",
    packages: [],
    targets: [
        .target(
            name: "HaruganaApp",
            destinations: .iOS,
            product: .app,
            bundleId: "com.jjikkyu.harugana",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["HaruganaApp/Sources/**"],
            resources: ["HaruganaApp/Resources/**"],
            dependencies: [],
            settings: .settings(
                base: ["DEVELOPMENT_TEAM": "V237TD2AXA"],
                configurations: [],
                defaultSettings: .recommended
            )
        ),
        .target(
            name: "HaruganaWatchKit",
            destinations: .watchOS,
            product: .watch2Extension,
            bundleId: "com.jjikkyu.harugana.watchKitApp",
            infoPlist: .extendingDefault(
                with: [
                     "WKWatchKitApp": .boolean(true),
                     "WKCompanionAppBundleIdentifier": "com.jjikkyu.harugana"
                ]
            ),
            sources: ["Harugana/Sources/**"],
            resources: ["Harugana/Resources/**"],
            dependencies: [
                .project(target: "HiraganaService", path: .relativeToRoot("Modules/HiraganaService"), condition: .none),
            ],
            settings: .settings(
                base: ["DEVELOPMENT_TEAM": "V237TD2AXA"],
                configurations: [],
                defaultSettings: .recommended
            )
        ),
        .target(
            name: "Harugana",
            destinations: .watchOS,
            product: .app,
            bundleId: "com.jjikkyu.harugana.watchKitApp",
            infoPlist: .extendingDefault(
                with: [
                     "WKApplication": .boolean(true),
                     "WKCompanionAppBundleIdentifier": "com.jjikkyu"
                ]
            ),
            sources: ["Harugana/Sources/**"],
            resources: ["Harugana/Resources/**"],
            dependencies: [
                .project(target: "HiraganaService", path: .relativeToRoot("Modules/HiraganaService"), condition: .none),
            ],
            settings: .settings(
                base: ["DEVELOPMENT_TEAM": "V237TD2AXA"],
                configurations: [],
                defaultSettings: .recommended
            )
        ),
        .target(
            name: "HaruganaTests",
            destinations: .watchOS,
            product: .unitTests,
            bundleId: "com.jjikkyu.HaruganaTests",
            infoPlist: .default,
            sources: ["Harugana/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Harugana")]
        ),
    ]
)
