import ProjectDescription

let project: Project = .init(
    name: "Repository",
    targets: [
        .target(
            name: "Repository",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .framework,
            bundleId: "com.jjikkyu.Repository",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "Entity", path: .relativeToRoot("Modules/Entity"), condition: .none),
            ]
        )
    ]
)
