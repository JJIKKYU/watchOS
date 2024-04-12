//
//  HiraganaStudyBuilder.swift
//  HiraganaService
//
//  Created by 정진균 on 3/30/24.
//

import DependencyContainer
import Foundation
import Repository
import SDWebImage
import SDWebImageLottieCoder
import SwiftUI

public struct HiraganaStudyBuilder {
    public static func getHiraganaStudyView() -> HiraganaStudyView {
        // Lottie를 지원하기 위해서 HiraganaStudyView는 Lottie를 사용하므로 Corder를 지정하는 과정
        let lottieCoder = SDImageLottieCoder.shared
        SDImageCodersManager.shared.addCoder(lottieCoder)

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
