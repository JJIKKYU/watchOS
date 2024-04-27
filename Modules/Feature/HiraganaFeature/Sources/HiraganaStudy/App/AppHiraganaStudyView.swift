//
//  AppHiraganaStudyView.swift
//  HiraganaFeature
//
//  Created by 정진균 on 4/27/24.
//

import ComposableArchitecture
import SwiftUI

public struct AppHiraganaStudyView: View {
    @State public var store: StoreOf<AppHiraganaStudyFeature>

    public var body: some View {
        Text("text, \(store.selectedHiragana ?? "")")
    }

    public init(store: StoreOf<AppHiraganaStudyFeature>) {
        self.store = store
    }
}
