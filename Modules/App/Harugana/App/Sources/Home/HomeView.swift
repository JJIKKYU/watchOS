import ComposableArchitecture
import HiraganaFeature
import SwiftUI
import DependencyContainer
import Entity

struct HomeView: View {
    @State var store: StoreOf<HomeFeature>

    public init(store: StoreOf<HomeFeature>) {
        self.store = store

        store.send(.getHiraganaRows)
        store.send(.getDailyWord)
    }

    public var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List {
                Section {
                    if let dailyWord = store.dailyWord {
                        VStack(alignment: .leading, spacing: 8, content: {
                            HStack(alignment: .bottom, spacing: 6, content: {
                                Text(dailyWord.word)
                                    .bold()
                                    .font(.title2)
                                Text(dailyWord.pronunciation)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            })
                            Text(dailyWord.meaning)
                                .foregroundStyle(.gray)
                        })
                        .transition(.opacity)
                    } else {
                        ProgressView()
                    }
                } header: {
                    Text("오늘의 단어")
                }
                .listStyle(.sidebar)

                Section {
                    ForEach(store.hiraganaRows, id: \.self) { (row: String) in
                        NavigationLink(
                            state: HomeFeature.Path.State.hiraganaStudyFeature(
                                .init(
                                    selectedHiragana: row
                                )
                            )
                        ) {
                            Text(
                                "\(row)행"
                            )
                        }
                    }
                } header: {
                    Text("히라가나")
                }
            }
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.large)
        } destination: { (store: StoreOf<HomeFeature.Path>) in
            switch store.state {
            case .hiraganaStudyFeature:
                if let store = store.scope(state: \.hiraganaStudyFeature, action: \.pushHiraganaStudyFeature) {
                    AppHiraganaStudyView(store: store)
                }
            }
        }
    }
}

/*
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(
            initialState: HomeFeature.State()) {
                HomeFeature()
            }
        HomeView(
            store: store
        )
    }
}
*/
