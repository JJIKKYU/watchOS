import ProjectDescription

let project = Project(
    name: "Harugana",
    packages: [],
    targets: [
        .target(
            name: "Harugana",
            destinations: .watchOS,
            product: .app,
            bundleId: "com.jjikkyu.harugana",
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
            ]
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
