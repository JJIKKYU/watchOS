import ProjectDescription

let project: Project = .init(
    name: "HiraganaService",
    targets: [
        .target(
            name: "HiraganaService",
            destinations: .watchOS,
            product: .framework,
            bundleId: "com.jjikkyu.HiraganaService",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "Dependency", path: .relativeToRoot("Modules/Dependency"), condition: .none),
            ]
        )
    ]
)
