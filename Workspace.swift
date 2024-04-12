import ProjectDescription

let appName: String = "Harugana"

let workspace = Workspace(
    name: appName,
    projects: [
        .path("Modules/App/Harugana"),
    ]
)
