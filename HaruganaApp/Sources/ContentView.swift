import SwiftUI
import ComposableArchitecture

public struct ContentView: View {
    let store: StoreOf<HomeFeature>

    public var body: some View {
        Form {
            Section {
                Text("\(store.count)")
                Button("Decrement") { store.send(.decrementButtonTapped) }
                Button("Increment") { store.send(.incrementButtonTapped) }
            }

            Section {
                Button("Number fact") { store.send(.numberFactButtonTapped) }
            }

            if let fact = store.numberFact {
                Text(fact)
            }
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
