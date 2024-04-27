import ComposableArchitecture
import DependencyContainer
import HiraganaFeature
import Repository
import SwiftUI
import Swinject
import SwinjectAutoregistration

@main
struct Harugana: App {
    var body: some Scene {
        WindowGroup {
            AppContainer.resolve(HomeView.self)
        }
    }

    init() {
        injectDependency()
        injectScene()
        print("init!")
    }
}

// MARK: - Dependency Injection

extension Harugana {
    func injectDependency(_ container: Container = AppContainer.container) {
        container.autoregister(JsonRepositoryProtocol.self, initializer: JsonRepository.init)
        container.autoregister(OpenAIRepositoryProtocol.self, initializer: OpenAIRepository.init)
    }

    // View, Feature inject
    func injectScene(_ container: Container = AppContainer.container) {
        // HomeFeature, HomeView
        container.register(StoreOf<HomeFeature>.self) { r in
            .init(initialState: HomeFeature.State()) {
                HomeFeature()
            }
        }
        container.autoregister(HomeView.self, initializer: HomeView.init)

        // HiraganaDetailFeature, HiraganaDetailView
        container.register(StoreOf<HiraganaWritingFeature>.self) { _ in
            .init(initialState: HiraganaWritingFeature.State()) {
                HiraganaWritingFeature()
            }
        }
        container.autoregister(HiraganaWritingView.self, initializer: HiraganaWritingView.init)

        // HiraganaStudyFeature, HiraganaStudyView
        container.register(StoreOf<AppHiraganaStudyFeature>.self) { _ in
            .init(initialState: AppHiraganaStudyFeature.State()) {
                AppHiraganaStudyFeature()
            }
        }
        container.autoregister(AppHiraganaStudyView.self, initializer: AppHiraganaStudyView.init)
    }
}
