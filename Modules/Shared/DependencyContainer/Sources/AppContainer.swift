//
//  DependencyContainer.swift
//  Dependency
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Swinject

public class AppContainer {
    public static let shared = AppContainer()

    public static let container: Container = Container()

    private init() {}

    public static func resolve<T>(_ type: T.Type) -> T? {
        return Self.container.synchronize().resolve(type.self)
    }
}
