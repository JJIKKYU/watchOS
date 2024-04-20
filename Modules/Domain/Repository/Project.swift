import ProjectDescription

let project: Project = .init(
    name: "Repository",
    packages: [
    ],
    targets: [
        .target(
            name: "Repository",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .framework,
            bundleId: "com.jjikkyu.Repository",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture", condition: .none),
                .external(name: "OpenAI", condition: .none),
                .project(target: "Entity", path: .relativeToRoot("Modules/Core/Entity"), condition: .none),
                .project(target: "DependencyContainer", path: .relativeToRoot("Modules/Shared/DependencyContainer"), condition: .none),
            ]
        )
    ]
)
