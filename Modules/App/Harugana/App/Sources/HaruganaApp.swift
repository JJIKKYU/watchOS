import ComposableArchitecture
import DependencyContainer
import HiraganaFeature
import Repository
import SwiftUI

@main
struct Harugana: App {
    var body: some Scene {
        WindowGroup {
            let store = Store(
                initialState: HomeFeature.State()) {
                    HomeFeature()
                }
            ContentView(
                store: store
            )
        }
    }

    init() {
        injectDependency()
        print("init!")
    }
}

// MARK: - Dependency Injection

extension Harugana {
    func injectDependency() {
        DependencyContainer.shared.container.register(JsonRepositoryProtocol.self) { _ in
            JsonRepository()
        }.inObjectScope(.container)
    }
}
