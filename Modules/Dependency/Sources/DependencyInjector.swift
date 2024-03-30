//
//  DependencyInjector.swift
//  Dependency
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Entity
import Repository
import Swinject

public class DependencyInjector {
    public static let shared = DependencyInjector()

    public let container: Container

    public init() {
        container = Container()
        registerDependency()
    }

    private func registerDependency() {
        container.register(JsonRepositoryProtocol.self) { _ in
            return JsonRepository()
        }.inObjectScope(.container)
    }
}