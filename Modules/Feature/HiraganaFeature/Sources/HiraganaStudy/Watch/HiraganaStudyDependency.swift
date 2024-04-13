//
//  HiraganaStudyDependency.swift
//  HiraganaService
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Repository

// MARK: - DashboardDependencyProtocol

public protocol HiraganaStudyDependencyProtocol {
    var jsonRepository: JsonRepositoryProtocol? { get }
}

// MARK: - DashboardDependency

public struct HiraganaStudyDependency: HiraganaStudyDependencyProtocol {
    public var jsonRepository: JsonRepositoryProtocol?

    public init(jsonRepository: JsonRepositoryProtocol?) {
        self.jsonRepository = jsonRepository
    }
}
