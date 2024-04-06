import SwiftUI
import ComposableArchitecture

@main
struct TttesApp: App {
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
}
