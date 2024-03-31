import SwiftUI
import Entity
import Dependency
import Repository
import HiraganaService

@main
struct WatchOSTestApp: App {
    var body: some Scene {
        WindowGroup {
            HiraganaStudyBuilder.getHiraganaStudyView()
        }
    }

    init() {
    }
}
