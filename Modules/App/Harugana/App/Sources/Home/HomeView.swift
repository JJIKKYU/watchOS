import ComposableArchitecture
import HiraganaFeature
import SwiftUI

public struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>

    init(store: StoreOf<HomeFeature>) {
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
                    // .background(.gray.opacity(0.6))
                    // .cornerRadius(8)
                } header: {
                    Text("오늘의 단어")
                }
                .transition(.move(edge: .leading))
                .listStyle(.sidebar)
//                    .listRowBackground(Color.clear)
//                    .listRowInsets(EdgeInsets())

                Section {
                    ForEach(store.hiraganaRows, id: \.self) { row in
                        NavigationLink(state: HomeFeature.Path.State.hiraganaDetailFeature()) {
                            Button("\(row)행") {
                                print("pressedHiraganaSection! -2")
                                // store.send(.pressedHiraganaSection(row))
                            }
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
            case .hiraganaDetailFeature:
                if let store = store.scope(state: \.hiraganaDetailFeature, action: \.pushHiraganaDetailFeature) {
                    HiraganaDetailView(store: store)
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
