import ProjectDescription

let project: Project = .init(
    name: "HiraganaFeature",
    packages: [
    ],
    targets: [
        .target(
            name: "HiraganaFeature",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .framework,
            bundleId: "com.jjikkyu.HiraganaFeature",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture", condition: .none),
                .external(name: "SDWebImageLottieCoder", condition: .none),
                .external(name: "SDWebImageSwiftUI", condition: .none),
                .project(target: "DependencyContainer", path: .relativeToRoot("Modules/Shared/DependencyContainer"), condition: .none),
                .project(target: "Repository", path: .relativeToRoot("Modules/Domain/Repository"), condition: .none),
            ]
        )
    ]
)
