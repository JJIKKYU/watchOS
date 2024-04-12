//
//  HiraganaDetailFeature.swift
//  HaruganaApp
//
//  Created by 정진균 on 4/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HiraganaDetailFeature {
    @ObservableState
    struct State: Equatable {
        var test: String?
    }

    enum Action {
        case testAction
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .testAction:
                print("TestAction!")
                return .none
            }
        }
    }
}
