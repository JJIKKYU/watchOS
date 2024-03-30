// Module.swift 파일
import ProjectDescription

// scaffold 명령어 시 받을 인자.
let name: Template.Attribute = .required("name")
let author: Template.Attribute = .required("author")
let currentDate: Template.Attribute = .required("currentDate")

// 템플릿 선언.
let moduleTemplate = Template(
    description: "A template for a new feature module",
    attributes: [
        name,
        author,
        currentDate
    ],
    items: ModuleTemplate.allCases.map { $0.item }
)

enum ModuleTemplate: CaseIterable {
    case project
    case resource
    case temp

    // 템플릿 내부에 추가할 파일.
    var item: Template.Item {
        switch self {
        case .project:
            return .file(path: .basePath + "/Project.swift", templatePath: "Project.stencil")

        case .resource:
            return .directory(path: .basePath + "/Resources", sourcePath: "Temp.stencil")

        case .temp:
            return .file(path: .basePath + "/Sources/Temp.swift", templatePath: "Temp.stencil")
        }
    }
}

// 템플릿을 추가할 기본 경로.
extension String {
    static var basePath: Self {
        return "Modules/\(name)"
    }
}
