import ProjectDescription

let project: Project = .init(
    name: "Dependency",
    packages: [
        .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .exact("2.8.0"))
    ],
    targets: [
        .target(
            name: "Dependency",
            destinations: .watchOS,
            product: .framework,
            bundleId: "com.jjikkyu.Dependency",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .package(product: "Swinject", type: .runtime, condition: .none),
                .project(target: "Repository", path: .relativeToRoot("Modules/Repository"), condition: .none),
            ]
        )
    ]
)
