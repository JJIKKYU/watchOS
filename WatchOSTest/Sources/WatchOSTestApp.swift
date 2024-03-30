import SwiftUI
import Entity

@main
struct WatchOSTestApp: App {
    var body: some Scene {
        WindowGroup {
            getDashboardView()
        }
    }

    init() {
        print("JJIKKYU!")
    }

    private func getDashboardView() -> DashboardView {
        let viewModel: DashboardViewModel = .init()
        let view: DashboardView = .init(viewModel: viewModel)
        return view
    }
}
