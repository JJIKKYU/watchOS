//
//  HiraganaStudyView.swift
//  HiraganaFeature
//
//  Created by 정진균 on 4/12/24.
//

import SwiftUI
import ComposableArchitecture

public struct HiraganaDetailView: View {
    public let store: StoreOf<HiraganaDetailFeature>

    public var body: some View {
        Button("Hello, World") {
            store.send(.testAction)
        }
    }

    public init(store: StoreOf<HiraganaDetailFeature>) {
        self.store = store
    }
}

#Preview {
    let store = Store(
        initialState: HiraganaDetailFeature.State()
    ) {
        HiraganaDetailFeature()
    }
    return HiraganaDetailView(
        store: store
    )
}

