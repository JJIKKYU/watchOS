import ProjectDescription

let project: Project = .init(
    name: "DependencyContainer",
    packages: [
        .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .exact("2.8.0"))
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
                .package(product: "Swinject", type: .runtime, condition: .none),
            ]
        )
    ]
)
