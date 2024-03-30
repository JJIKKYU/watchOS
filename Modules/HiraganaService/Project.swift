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
                .project(target: "Entity", path: .relativeToRoot("Modules/Entity"), condition: .none),
                .project(target: "Repository", path: .relativeToRoot("Modules/Repository"), condition: .none),
                .project(target: "Dependency", path: .relativeToRoot("Modules/Dependency"), condition: .none),
            ]
        )
    ]
)
