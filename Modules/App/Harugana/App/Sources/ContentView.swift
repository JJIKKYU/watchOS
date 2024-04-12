import ComposableArchitecture
import HiraganaFeature
import SwiftUI

public struct ContentView: View {
    @Bindable var store: StoreOf<HomeFeature>

    public var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 8, content: {
                        HStack(alignment: .bottom, spacing: 6, content: {
                            Text("こんにちは")
                                .bold()
                                .font(.title2)
                            Text("Konnichiwa")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        })
                        Text("안녕하세요.")
                            .foregroundStyle(.gray)
                    })
                    .background(.gray.opacity(0.6))
                    .cornerRadius(8)
                } header: {
                    Text("오늘의 단어")
                }
                .listStyle(.sidebar)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                Section {
                    NavigationLink(state: HiraganaDetailFeature.State()) {
                        Button("あ행") {
                            store.send(.pressedHiraganaSection("あ행"))
                            print("あ행!")
                        }
                    }
                    NavigationLink(state: HiraganaDetailFeature.State()) {
                        Button("あ행") {
                            print("あ행!")
                        }
                    }
                    Text("か행")
                    Text("さ행")
                    Text("た행")
                    Text("な행")
                    Text("は행")
                    Text("ま행")
                    Text("や행")
                    Text("ら행")
                    Text("わ행")
                } header: {
                    Text("히라가나")
                }
            }
//            Form {
//                Section {
//                    Text("\(store.count)")
//                    Button("Decrement") { store.send(.decrementButtonTapped) }
//                    Button("Increment") { store.send(.incrementButtonTapped) }
//                }
//
//                Section {
//                    Button("Number fact") { store.send(.numberFactButtonTapped) }
//                }
//
//                if let fact = store.numberFact {
//                    Text(fact)
//                }
//            }
            .navigationTitle("Harugana")
            .navigationBarTitleDisplayMode(.large)
        } destination: { store in
            HiraganaDetailView(store: store)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(
            initialState: HomeFeature.State()) {
                HomeFeature()
            }
        ContentView(
            store: store
        )
    }
}
