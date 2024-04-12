import ProjectDescription

let project: Project = .init(
    name: "Harugana",
    packages: [
        .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .upToNextMajor(from: "1.9.2"))
    ],
    targets: [
        .target(
            name: "HaruganaApp",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .app,
            bundleId: "com.jjikkyu.Harugana",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
//                    "UIApplicationSceneManifest": [
//                        "UIApplicationSupportsMultipleScenes": false,
//                        "UISceneConfigurations": [
//                            "UIWindowSceneSessionRoleApplication": [
//                                [
//                                    "UISceneConfigurationName": "Default Configuration",
//                                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
//                                ],
//                            ]
//                        ]
//                    ],
                ]
            ),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            dependencies: [
                .package(product: "ComposableArchitecture", type: .runtime, condition: nil),
                .project(target: "HiraganaFeature", path: .relativeToRoot("Modules/Feature/HiraganaFeature"), condition: .none),
            ],
            settings: .settings(
                base: ["DEVELOPMENT_TEAM": "V237TD2AXA"],
                configurations: [],
                defaultSettings: .recommended
            )
        ),
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
            sources: ["Watch/Sources/**"],
            resources: ["Watch/Resources/**"],
            dependencies: [
                .project(target: "HiraganaFeature", path: .relativeToRoot("Modules/Feature/HiraganaFeature"), condition: .none),
            ],
            settings: .settings(
                base: ["DEVELOPMENT_TEAM": "V237TD2AXA"],
                configurations: [],
                defaultSettings: .recommended
            )
        )
    ]
)
