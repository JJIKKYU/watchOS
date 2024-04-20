import ProjectDescription

let project: Project = .init(
    name: "DependencyContainer",
    packages: [
    ],
    targets: [
        .target(
            name: "DependencyContainer",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .framework,
            bundleId: "com.jjikkyu.DependencyContainer",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "Swinject", condition: .none),
                .external(name: "SwinjectAutoregistration", condition: .none)
            ]
        )
    ]
)
