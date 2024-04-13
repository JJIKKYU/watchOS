//
//  DependencyContainer.swift
//  Dependency
//
//  Created by 정진균 on 3/30/24.
//

import Foundation
import Swinject

public class DependencyContainer {
    public static let shared = DependencyContainer()

    public let container: Container

    private init() {
        container = Container()
    }
}
