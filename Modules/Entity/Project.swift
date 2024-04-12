import ProjectDescription

let project: Project = .init(
    name: "Entity",
    targets: [
        .target(
            name: "Entity",
            destinations: [.iPhone, .iPad, .appleWatch],
            product: .framework,
            bundleId: "com.jjikkyu.Entity",
            sources: ["Sources/**"],
            resources: ["Resources/**"]
        )
    ]
)
