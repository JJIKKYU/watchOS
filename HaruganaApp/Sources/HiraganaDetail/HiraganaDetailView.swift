//
//  HiraganaDetailView.swift
//  HaruganaApp
//
//  Created by 정진균 on 4/12/24.
//

import SwiftUI
import ComposableArchitecture

struct HiraganaDetailView: View {
    let store: StoreOf<HiraganaDetailFeature>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let store = Store(initialState: HiraganaDetailFeature.State()) {
        HiraganaDetailFeature()
    }
    return HiraganaDetailView(store: store)
}
