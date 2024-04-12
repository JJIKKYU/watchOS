import ProjectDescription

let project: Project = .init(
    name: "HaruganaWatch",
    targets: [
        .target(
            name: "HaruganaWatch",
            destinations: .watchOS,
            product: .watch2Extension,
            bundleId: "com.jjikkyu.harugana.watchKit",
            infoPlist: .extendingDefault(
                with: [
                     "WKWatchKitApp": .boolean(true),
                     "WKCompanionAppBundleIdentifier": "com.jjikkyu.harugana"
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "HiraganaService", path: .relativeToRoot("Modules/Feature/HiraganaService"), condition: .none),
            ],
            settings: .settings(
                base: ["DEVELOPMENT_TEAM": "V237TD2AXA"],
                configurations: [],
                defaultSettings: .recommended
            )
        )
    ]
)
