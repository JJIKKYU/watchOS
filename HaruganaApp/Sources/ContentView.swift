import SwiftUI
import ComposableArchitecture

public struct ContentView: View {
    let store: StoreOf<HomeFeature>

    public var body: some View {
        NavigationStack {
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
                } header: {
                    Text("오늘의 단어")
                }
                .listStyle(.sidebar)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                Section {
                    Text("모음")
                    Text("Text2")
                    Text("Text3")
                    Text("Text4")
                    Text("Text5")
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
