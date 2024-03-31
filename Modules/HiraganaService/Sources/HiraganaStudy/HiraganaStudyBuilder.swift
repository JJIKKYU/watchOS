//
//  HiraganaStudyBuilder.swift
//  HiraganaService
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Repository
import Dependency
import SwiftUI

public struct HiraganaStudyBuilder {
    public static func getHiraganaStudyView() -> HiraganaStudyView {
        let jsonRepository: JsonRepositoryProtocol? = DependencyContainer.shared
            .container.resolve(JsonRepositoryProtocol.self)

        let dependency: HiraganaStudyDependencyProtocol = HiraganaStudyDependency(
            jsonRepository: jsonRepository
        )
        let viewModel: HiraganaStudyViewModel = .init(
            dependency: dependency
        )
        let view: HiraganaStudyView = .init(viewModel: viewModel)
        return view
    }
}
